# Exercício Workflows Git

Utilizaremos uma amostra dos dados de 2006 do dataset: [Data Expo 2009: Airline on time
data](https://doi.org/10.7910/DVN/HG7NV7).

Utilize esse [link](data/2006-sample.csv) para baixar o arquivo csv.

Uma descrição dos dados presentes no dataset pode ser encontrada nesse
[link](http://stat-computing.org/dataexpo/2009/the-data.html).

Em duplas, utilizar o workflow de *feature branch* e escrever códigos em `bash script` para resolver os seguintes problemas.


Para cada *feature*, uma *issue* precisa ser aberta. A issue deve ser assinalada a um dos componentes da dupla. O *pull request* com a implementação da feature deve fechar a *issue* relacionada. Por favor verificar [essa referência](https://docs.github.com/en/github/managing-your-work-on-github/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword) sobre como relacionar uma *issue* a um *pull request*.

## Features

1. Descobrir a quantiade de atrasos de uma dada companhia passada como parâmetro. Consultar [essa referência](https://tecadmin.net/tutorial/bash-scripting/bash-command-arguments/) sobre como criar e receber parâmetros em um script bash.

`echo "O número total de decolagens feitas com atraso na companhia" $@ ":"
tail -n +2 2006-sample.csv | grep $@ | awk -F , '$16>0' | cut  -d , -f 16 | grep -v '^0' | wc -l` 

`echo "O número total de aterrissagens feitas com atraso na companhia" $@ ":"
tail -n +2 2006-sample.csv | grep $@ | awk -F , '$15>0' | cut  -d , -f 15 | grep -v '^0' | wc -l`

2. Descobrir o vôo com maior atraso na chegada (`ArrDelay`) registrado.

`echo "O voo com maior atraso na chegada é:" 
tail -n +2 2006-sample.csv | sort -n -t , -k 15 | tail -n1`

3. Descobrir o vôo com maior atraso na saída (`DepDelay`) registrado.

`echo "O voo com maior atraso na saída é:" 
tail -n +2 2006-sample.csv | sort -n -t , -k 16 | tail -n1`

4. Descobrir o vôo mais longo.

`echo "O voo mais longo é:" 
tail -n +2 2006-sample.csv | sort -n -t , -k 14 | tail -n1`

5. Contar quantos vôos precisaram ser redirecionados (`Diverted`).

`echo "O número de voos redirecionados é:" 
tail -n +2 2006-sample.csv | cut -d , -f 24 | grep 1 | wc -l`

6. Utilizando a dica [nessa resposta](https://stackoverflow.com/a/3096575), calcular o tempo de atraso total para a companhia `Delta Air Lines`. Não esquecer de filtrar linhas com dados faltando e também com valores negativos (casos em que os vôos são adiantados) 

`echo "O atraso de chegada total da Delta Airlines foi de:"
grep -i 'DL' 2006-sample.csv | awk -F , '$15>0' | grep -v '^0' | cut -d , -f 15 | paste -sd+ - | bc`

`echo "O atraso de saída total da Delta Airlines foi de:"
grep -i 'DL' 2006-sample.csv | awk -F , '$16>0' | grep -v '^0' | cut -d , -f 16 | paste -sd+ - | bc`

7. Mostrar o tempo total de atrasos para a decolagem de vôos no aeroporto `JFK`, de Nova Iorque.

`echo "O tempo total de atrasos na decolagem para o aeroporto JFK foi de:"
grep -i 'JFK' 2006-sample.csv | awk -F , '$16>0' | grep -v '^0' | cut -d , -f 16 | paste -sd+ - | bc`

8. Mostrar o tempo total de atrasos para pousos no `Aeroporto Internacional de Los Angeles`.

`echo "O tempo total de atrasos na aterrissagem para o aeroporto LAX foi de:"
grep -i 'LAX' 2006-sample.csv | awk -F , '$15>0' | grep -v '^0' | cut -d , -f 15 | paste -sd+ - | bc`

##### Bonus
Utilizar a referência no [link](https://stackoverflow.com/a/1521498), para construir scripts que implementem as seguintes funcionalidades:

1. Listar qual companhia teve o maior tempo total de atrasos (atrasos somente na decolagem).

`tail -n +2 2006-sample.csv | cut -d , -f 9 | sort | uniq > companhias.csv`
`>atrasos.txt`

`while read p; do
	ATR=$(tail -n +2 2006-sample.csv | grep -i "$p" | cut -d , -f 16 | grep -v -e '^[[:space:]]*$' | grep -v "-" | paste -sd+ | bc)
	echo "$p,${ATR}" >> atrasos.txt
done <companhias.csv`

`sort -n -t , -k 2 atrasos.txt | tail -n -1`

2. Listar qual aeroporto teve o maior tempo total de atrasos (atrasos somente na decolagem).

`tail -n +2 2006-sample.csv | cut -d , -f 17 | sort | uniq > aeroportos.csv`
`>atrasos-aero.txt`

`while read p; do
	ATR=$(tail -n +2 2006-sample.csv | grep -i "$p" | cut -d , -f 16 | grep -v -e '^[[:space:]]*$' | grep -v "-" | paste -sd+ | bc)
	echo "$p,${ATR}" >> atrasos-aero.txt
done <aeroportos.csv`

`sort -n -t , -k 2 atrasos-aero.txt | tail -n -1`

### Bom trabalho a Todos!

