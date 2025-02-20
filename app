<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agendamento JMC</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .container { max-width: 600px; margin: auto; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Agendamento JMC</h2>
        <form id="formAgendamento">
            <label>Nome:</label>
            <input type="text" id="nome" required>
            <br><br>
            <label>Telefone:</label>
            <input type="tel" id="telefone" required>
            <br><br>
            <label>Serviço:</label>
            <select id="servico" required>
                <option value="" selected disabled>Selecione um serviço</option>
                <option value="Manutenção de Computadores">Manutenção de Computadores</option>
                <option value="Instalação de Softwares">Instalação de Softwares</option>
                <option value="Montagem de Computadores">Montagem de Computadores</option>
                <option value="Consultoria">Consultoria</option>
            </select>
            <br><br>
            <label>Data:</label>
            <input type="date" id="data" required>
            <br><br>
            <button type="submit">Agendar</button>
        </form>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.getElementById("formAgendamento").addEventListener("submit", function(event) {
                event.preventDefault();
                
                let nome = document.getElementById("nome").value.trim();
                let telefone = document.getElementById("telefone").value.trim();
                let servico = document.getElementById("servico").value;
                let data = document.getElementById("data").value;

                if (nome && telefone && servico && data) {
                    let url = 'SUA_URL_DO_APLICATIVO'; // Substitua pela URL do seu Apps Script

                    let formData = new URLSearchParams();
                    formData.append('nome', nome);
                    formData.append('telefone', telefone);
                    formData.append('servico', servico);
                    formData.append('data', data);

                    fetch(url, {
                        method: 'POST',
                        headers: { "Content-Type": "application/x-www-form-urlencoded" },
                        body: formData.toString()
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.result === "success") {
                            alert('Agendamento realizado com sucesso!');
                            document.getElementById("formAgendamento").reset();
                        } else {
                            alert('Erro ao enviar os dados: ' + data.message);
                        }
                    })
                    .catch(error => {
                        alert('Erro ao enviar os dados: ' + error);
                        console.error(error);
                    });
                } else {
                    alert("Preencha todos os campos antes de agendar!");
                }
            });
        });
    </script>
</body>
</html>
