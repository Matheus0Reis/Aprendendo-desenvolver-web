document.addEventListener("DOMContentLoaded", () => {
    const selectProduto = document.getElementById("produtoSelecionado");
    const listaItens = document.getElementById("itensVenda");
    const totalSpan = document.getElementById("totalVenda");
    const form = document.getElementById("form-pdv");
    const finalizarBtn = document.getElementById("finalizarVenda");
    document.addEventListener("DOMContentLoaded", () => {
        const selectCliente = document.getElementById("clienteSelecionado");
        const clientes = JSON.parse(localStorage.getItem("clientes")) || [];
        clientes.push({ nome: nomeCliente, email: emailCliente }); // Exemplo de objeto de cliente
        localStorage.setItem("clientes", JSON.stringify(clientes));
        
      
        clientes.forEach(cliente => {
          const option = document.createElement("option");
          option.value = cliente.nome; // ou cliente.id, se usar IDs
          option.textContent = cliente.nome;
          selectCliente.appsendChild(option);
        });
      
        document.getElementById("finalizarVenda").addEventListener("click", () => {
            const clienteSelecionado = document.getElementById("clienteSelecionado").value;
          
            const novaVenda = {
              data: new Date().toISOString().split("T")[0],
              cliente: clienteSelecionado || "Não informado",
              itens: carrinho
            };
          
            const vendas = JSON.parse(localStorage.getItem("vendas")) || [];
            vendas.push(novaVenda);
            localStorage.setItem("vendas", JSON.stringify(vendas));
          
            alert("Venda finalizada!");
            // Limpa carrinho e cliente
          });
          
        // ... código do carrinho etc ...
      });
      
  
    let vendaAtual = [];
  
    const carregarProdutos = () => {
      const produtos = JSON.parse(localStorage.getItem("produtos")) || [];
      selectProduto.innerHTML = "";
      produtos.forEach((p, i) => {
        const option = document.createElement("option");
        option.value = i;
        option.textContent = `${p.nome} - R$ ${Number(p.preco).toFixed(2)}`;
        selectProduto.appendChild(option);
      });
    };
  
    const atualizarListaVenda = () => {
      listaItens.innerHTML = "";
      let total = 0;
      vendaAtual.forEach((item, i) => {
        const li = document.createElement("li");
        const subtotal = item.preco * item.qtd;
        total += subtotal;
        li.className = "list-group-item d-flex justify-content-between";
        li.innerHTML = `
          <div>
            ${item.nome} (x${item.qtd})<br>
            <small>R$ ${item.preco.toFixed(2)} cada</small>
          </div>
          <strong>R$ ${subtotal.toFixed(2)}</strong>
        `;
        listaItens.appendChild(li);
      });
      totalSpan.textContent = total.toFixed(2);
    };
  
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const index = parseInt(selectProduto.value);
      const qtd = parseInt(document.getElementById("quantidade").value);
      const produtos = JSON.parse(localStorage.getItem("produtos")) || [];
      const produto = produtos[index];
  
      if (produto && qtd > 0 && produto.estoque >= qtd) {
        produto.estoque -= qtd;
        localStorage.setItem("produtos", JSON.stringify(produtos));
  
        vendaAtual.push({
          nome: produto.nome,
          preco: produto.preco,
          qtd: qtd
        });
  
        atualizarListaVenda();
      } else {
        alert("Estoque insuficiente ou produto inválido.");
      }
  
      form.reset();
      carregarProdutos();
    });
  
    finalizarBtn.addEventListener("click", () => {
      if (vendaAtual.length === 0) {
        alert("Adicione produtos antes de finalizar.");
        return;
      }
  
      const vendas = JSON.parse(localStorage.getItem("vendas")) || [];
      vendas.push({
        data: new Date().toLocaleString(),
        itens: vendaAtual
      });
  
      localStorage.setItem("vendas", JSON.stringify(vendas));
      vendaAtual = [];
      atualizarListaVenda();
      alert("Venda finalizada!");
    });
  
    carregarProdutos();
  });
  