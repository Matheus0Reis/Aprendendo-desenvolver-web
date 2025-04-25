document.addEventListener("DOMContentLoaded", () => {
    const listaVendas = document.getElementById("lista-vendas");
    const vendas = JSON.parse(localStorage.getItem("vendas")) || [];
  
    const renderVendas = (vendasFiltradas) => {
      listaVendas.innerHTML = "";
  
      if (vendasFiltradas.length === 0) {
        listaVendas.innerHTML = `<div class="alert alert-info">Nenhuma venda encontrada.</div>`;
        return;
      }
  
      vendasFiltradas.forEach((venda, index) => {
        const totalVenda = venda.itens.reduce((sum, item) => sum + item.preco * item.qtd, 0);
        const card = document.createElement("div");
        card.className = "card mb-3 shadow";
  
        card.innerHTML = `
          <div class="card-header d-flex justify-content-between align-items-center">
            <strong>${venda.data}</strong>
            <span><strong>Cliente:</strong> ${venda.cliente || "Não informado"}</span>
          </div>
          <div class="card-body">
            <table class="table table-sm">
              <thead>
                <tr>
                  <th>Produto</th>
                  <th>Qtd</th>
                  <th>Unitário</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                ${venda.itens.map(item => `
                  <tr>
                    <td>${item.nome}</td>
                    <td>${item.qtd}</td>
                    <td>R$ ${item.preco.toFixed(2)}</td>
                    <td>R$ ${(item.qtd * item.preco).toFixed(2)}</td>
                  </tr>
                `).join("")}
              </tbody>
            </table>
            <div class="d-flex justify-content-between">
              <strong>Total da venda: R$ ${totalVenda.toFixed(2)}</strong>
              <button class="btn btn-outline-primary btn-sm" onclick="imprimirRecibo(${index})">Imprimir Recibo</button>
            </div>
          </div>
        `;
        listaVendas.appendChild(card);
      });
    };
  
    renderVendas(vendas);
  
    // FILTRO POR DATA
    document.getElementById("filtroData").addEventListener("input", (e) => {
      const dataSelecionada = e.target.value;
      const filtradas = vendas.filter(v => v.data.startsWith(dataSelecionada));
      renderVendas(filtradas);
    });
  
    // EXPORTAR JSON
    document.getElementById("exportarJson").addEventListener("click", () => {
      const blob = new Blob([JSON.stringify(vendas, null, 2)], { type: "application/json" });
      const link = document.createElement("a");
      link.href = URL.createObjectURL(blob);
      link.download = "vendas.json";
      link.click();
    });
  
    // EXPORTAR CSV
    document.getElementById("exportarCsv").addEventListener("click", () => {
      let csv = "Data,Cliente,Produto,Quantidade,Preço Unitário,Total\n";
      vendas.forEach(v => {
        v.itens.forEach(item => {
          csv += `${v.data},${v.cliente || "Não informado"},${item.nome},${item.qtd},${item.preco},${(item.qtd * item.preco).toFixed(2)}\n`;
        });
      });
  
      const blob = new Blob([csv], { type: "text/csv" });
      const link = document.createElement("a");
      link.href = URL.createObjectURL(blob);
      link.download = "vendas.csv";
      link.click();
    });
  
    // LIMPAR VENDAS
    document.getElementById("limparVendas").addEventListener("click", () => {
      if (confirm("Tem certeza que deseja apagar TODAS as vendas?")) {
        localStorage.removeItem("vendas");
        location.reload();
      }
    });
  });
  
  // IMPRESSÃO DE RECIBO
  function imprimirRecibo(index) {
    const vendas = JSON.parse(localStorage.getItem("vendas")) || [];
    const venda = vendas[index];
    let recibo = `RECIBO DE VENDA\nData: ${venda.data}\nCliente: ${venda.cliente || "Não informado"}\n\n`;
  
    venda.itens.forEach(item => {
      recibo += `${item.nome} (x${item.qtd}) - R$ ${(item.qtd * item.preco).toFixed(2)}\n`;
    });
  
    const total = venda.itens.reduce((sum, item) => sum + item.qtd * item.preco, 0);
    recibo += `\nTOTAL: R$ ${total.toFixed(2)}`;
  
    const novaJanela = window.open("", "_blank");
    novaJanela.document.write(`<pre>${recibo}</pre>`);
    novaJanela.print();
    novaJanela.close();
  }
  
  const novaVenda = {
    data: new Date().toISOString().split("T")[0],
    cliente: clienteSelecionado || "Não informado", // ajuste isso com base no seu input
    itens: carrinho
  };
  