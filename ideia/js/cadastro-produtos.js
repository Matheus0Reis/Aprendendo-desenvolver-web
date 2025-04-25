document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("form-produto");
    const lista = document.getElementById("lista-produtos");
  
    const salvarProduto = (produto) => {
      let produtos = JSON.parse(localStorage.getItem("produtos")) || [];
      produtos.push(produto);
      localStorage.setItem("produtos", JSON.stringify(produtos));
    };
  
    const carregarProdutos = () => {
      lista.innerHTML = "";
      let produtos = JSON.parse(localStorage.getItem("produtos")) || [];
      produtos.forEach((p, i) => {
        const li = document.createElement("li");
        li.className = "list-group-item d-flex justify-content-between align-items-center";
        li.innerHTML = `
          <div>
            <strong>${p.nome}</strong><br>
            <small>Preço: R$ ${Number(p.preco).toFixed(2)} | Estoque: ${p.estoque}</small>
          </div>
          <button class="btn btn-sm btn-danger" onclick="removerProduto(${i})">Excluir</button>
        `;
        lista.appendChild(li);
      });
    };
  
    window.removerProduto = (index) => {
      let produtos = JSON.parse(localStorage.getItem("produtos")) || [];
      produtos.splice(index, 1);
      localStorage.setItem("produtos", JSON.stringify(produtos));
      carregarProdutos();
    };
  
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const nome = document.getElementById("nomeProduto").value;
      const preco = parseFloat(document.getElementById("precoProduto").value);
      const estoque = parseInt(document.getElementById("estoqueProduto").value);
  
      const novoProduto = { nome, preco, estoque };
      salvarProduto(novoProduto);
      form.reset();
      carregarProdutos();
    });
  
    carregarProdutos();
  });
  