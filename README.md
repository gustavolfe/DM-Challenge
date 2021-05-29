# DM-Challenge

Fala pessoal blz? Primeiramente gostaria de agradecer pela oportunidade, e espero que o teste atinja os critérios que vocês procuram.

Mandei um email para Karolynne perguntando se poderia usar alguma biblioteca ou framework e ela me respondeu positivo, sendo assim
Utilizei algumas bibliotecas e o framework do robot para gerar os casos de testes e os relatórios.

Coloquei todas as dependências dentro do pipfile, então acredito que a única coisa que iram precisar baixar para executar os testes 
é o plugin "intellibot" para ele interpretar os arquivos do .robot | OBS: Baixar a versão que tem quase 400k de down..
Se não quiserem baixar o intellibot e executar pela ide, dá para executar por linha de comando, mas antes precisaria instalar as dependências do pipfile no python.

Após instalar o plugin ou por linha de comando, basta executar o seguinte comando : robot -d results src/test-case.robot

Os relatórios são persistidos dentro da pasta results no repositório DM-Challenge.

Dentro do arquivo test-case.robot é onde fica os casos de teste, dois deles pegam números aleatórios tanto inválidos quanto válidos para
realizar as validações, mas existe um terceiro que vocês podem alterar o valor e o idioma conforme vocês quiserem. 

keyword-test-case.robot é onde fica de fato o código do teste contido no arquivo test-case.robot

utils.py é onde fica os métodos python para geração de valores aleatórios dentro ou fora do range válido.

Qualquer dúvida podem me mandar um email que responderei o mais breve possível!!

Att,
Gustavo Felipe


