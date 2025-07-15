# 🛠️ Simul8 2021 Deployment (64 bits) - Script Batch para Lansweeper

Este repositório contém um script `.bat` desenvolvido para automatizar a instalação silenciosa do **Simul8 2021 (64 bits)** em ambientes Windows, utilizando **Lansweeper** como plataforma de deployment.

---

## 🚀 Objetivo

Padronizar a instalação do Simul8 EDU 2021 em máquinas do ambiente educacional, garantindo:

- Instalação silenciosa sem interação do usuário
- Registro detalhado de logs da instalação
- Compatibilidade com múltiplos caminhos de disco (`S:\` ou `C:\`)
- Facilidade de uso com ferramentas como o **Lansweeper**

---

## 🧩 Estrutura do Script

- **Detecção do disco S:**  
  Verifica se a unidade S: está disponível (ambiente educacional) e define o local de instalação de acordo.

- **Instalação silenciosa**  
  Executa o instalador com os parâmetros necessários para evitar interação e aplica a chave de licença.

- **Log centralizado**  
  Gera registros no diretório `C:\Logs\deployments.log`, com carimbo de data, hora e nível de severidade.

- **Sub-rotina reutilizável de logging**  
  Implementada com `:WriteLog`, facilita o uso em outros scripts.

---

## 💻 Exemplo de Execução

```batch
\\Servidor\Caminho\SETUPS8_EDU_UPGRADE.EXE /S DIR:"C:\Program Files\SIMUL8EDU" LIC:"XXXX-XXXX-XXXX"
