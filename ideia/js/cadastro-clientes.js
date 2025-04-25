document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("form-cliente");
    const lista = document.getElementById("lista-clientes");
  
    const salvarCliente = (cliente) => {
      let clientes = JSON.parse(localStorage.getItem("clientes")) || [];
      clientes.push(cliente);
      localStorage.setItem("clientes", JSON.stringify(clientes));
    };
  
    const carregarClientes = () => {
      lista.innerHTML = "";
      let clientes = JSON.parse(localStorage.getItem("clientes")) || [];
      clientes.forEach((c, i) => {
        const li = document.createElement("li");
        li.className = "list-group-item d-flex justify-content-between align-items-center";
        li.innerHTML = `
          <div>
            <strong>${c.nome}</strong><br>
            <small>${c.email} - ${c.telefone}</small>
          </div>
          <button class="btn btn-sm btn-danger" onclick="removerCliente(${i})">Excluir</button>
        `;
        lista.appendChild(li);
      });
    };
  
    window.removerCliente = (index) => {
      let clientes = JSON.parse(localStorage.getItem("clientes")) || [];
      clientes.splice(index, 1);
      localStorage.setItem("clientes", JSON.stringify(clientes));
      carregarClientes();
    };
  
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const nome = document.getElementById("nome").value;
      const email = document.getElementById("email").value;
      const telefone = document.getElementById("telefone").value;
  
      const novoCliente = { nome, email, telefone };
      salvarCliente(novoCliente);
      form.reset();
      carregarClientes();
    });
  
    carregarClientes();
  });
  