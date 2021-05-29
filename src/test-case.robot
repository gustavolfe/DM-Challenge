*** Settings ***

Library  Collections
Library  RequestsLibrary

Resource  keyword-test-case.robot

*** Test Cases ***

## Gera um valor randomico fora do intervalo disponivel pelo servico, e valida se o status_code é igual a 400 para ambas as linguagens
Validates invalid random data
    Validate invalid random value with specific language  pt-br
    Validate invalid random value with specific language  en

## Gera um valor randomico dentro do intervalo disponivel pelo servico, e valida se o status_code é igual a 200 para ambas as linguagens
## e compara se o valor por extenso do numero gerado é igual ao retornado pelo servico.
Validates numbers to words and sucessful data from random data
    Validate numbers to words with sucessful random value with specific language  pt-br
    Validate numbers to words with sucessful random value with specific language  en

## Como os testes acima geram valores aleatorios, fiz esse terceiro teste caso queiram imputar um valor especifico,
## basta trocar o idioma e o valor, lembrando que devem deixar um espacamento duplo entre os argumentos!!
Validates status and words from specific value and language
    Input a valid value and an language  pt-br  1234
    Input a invalid value and an language  pt-br  10001