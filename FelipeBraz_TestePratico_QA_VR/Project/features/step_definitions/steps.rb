Given(/^the VRPAT is available$/) do
  #atribuindo a URL disponibilizada à variável:
  $uri_base = "https://portal.vr.com.br/api-web/comum/enumerations/VRPAT"
end

When(/^I Send GET HTTP request$/) do
  #realizando uma requisição GET na url disponibilizada:
  $response = HTTParty.get($uri_base)
end

Then(/^I receive valid HTTP response code (\d+)$/) do |int|
  #validando que o status code retornado foi 200:
  expect($response.code).to eq(200)
  #evidenciando que a requisição GET retornou sucesso:
  puts "response code #{$response.code}"
end

Then(/^response body contains typeOfEstablishment object$/) do
  #validando que existe o objeto typeOfEstablishment:
  expect($response).to include("typeOfEstablishment")
  #printando o objeto typeOfEstablishment:
  puts "typeOfEstablishment : #{$response["typeOfEstablishment"]}"
end

Then(/^a random typeOfEstablishment is printed$/) do
  #pegando a contagem de itens do objeto:
  $count = $response["typeOfEstablishment"].size
  #criando um número aleatório entre 0 e a quantidade total de itens identificada:
  $randomNumber = rand($count)
  #printando o nome de um tipo de estabescimento aleatório:
  #ou seja, no response temos o objeto typeOfEstablishment
  #a posição aleatória de qual dos objetos de typeOfEstablishment que será exibida é definida pelo $randomNumber
  #e o nome da propriedade do objeto que será exibida é "name"
  puts "typeOfEstablishment : #{$response["typeOfEstablishment"][$randomNumber]["name"]}"
end
