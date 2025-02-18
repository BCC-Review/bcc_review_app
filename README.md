# BCC Review

## Membros da Equipe
- **Alex Lopes da Silva** – alex.lsilva154@gmail.com  
- **Max David** – maxdavidsouza@gmail.com  
- **Guilherme Rutemberg** – guilhermerutemfelix@gmail.com  

## Descrição do Projeto
O **BCC Review** é um aplicativo gamificado de revisão voltado para estudantes de Ciência da Computação. Inspirado na metodologia do Duolingo, o app oferece quizzes interativos para reforçar conceitos essenciais da área, como lógica de programação, algoritmos, estrutura de dados, sistemas operacionais, banco de dados, redes e segurança da informação.
O BCC Review permite que os usuários testem seus conhecimentos por meio de perguntas de múltipla escolha, desafios de completar código, identificação de erros e conceitos teóricos. Além disso, o sistema utiliza mecânicas de gamificação, como XP, níveis, conquistas e rankings, incentivando um aprendizado contínuo e motivador.

## Objetivo
Facilitar a revisão de conteúdos fundamentais da Ciência da Computação, tornando o aprendizado mais acessível e envolvente. O aplicativo é ideal para estudantes que desejam revisar antes de provas, se preparar para entrevistas técnicas ou apenas consolidar seus conhecimentos de forma divertida.

## Perfil do Usuário
- **Estudantes** de Ciência da Computação e áreas relacionadas.  
- **Pessoas** que querem revisar e fortalecer conhecimentos técnicos.  
- **Professores** que desejam recomendar uma ferramenta complementar para os alunos.  

## Principais Funcionalidades
- **Módulos de aprendizado** organizados por temas e níveis de dificuldade.
- **Quizzes interativos** com feedback instantâneo.
- **Sistema de progresso** com XP, conquistas e desafios diários.
- **Explicações detalhadas** para respostas erradas, incentivando o aprendizado contínuo.

## Histórias de Usuário

### Admin

#### Gerenciamento de Disciplinas

##### 1. Criar uma Disciplina
**Como** administrador do app,
**Quero** poder criar uma nova disciplina com o nome ícone e número de período,  
**Para que** eu possa organizar as disciplinas de acordo com o conteúdo e o período correspondente.

**Critérios de aceitação:**
- O administrador pode inserir o nome da disciplina.
- O administrador pode adicionar o número do período (ex: 1º, 2º, 3º, etc.).
- O administrador pode escolher um ícone para representar a disciplina (opcional).

```
Dado que o administrador está na página de criação de disciplina
Quando ele preenche o nome da disciplina, o número do período e escolhe um ícone
E clica no botão de criar disciplina
Então a disciplina é criada e redirecionado para uma página de exibição da disciplina, para adicionar módulos
```
---

##### 4. Editar disciplina
**Como** administrador do app,
**Quero** poder editar o nome, ícone e período de uma disciplina,
**Para que** eu possa atualizar as informações conforme necessário.

**Critérios de aceitação:**
- O administrador pode editar o nome da disciplina.
- O administrador pode alterar o ícone da disciplina.
- O administrador pode modificar o período da disciplina.

```
Dado que o administrador está na página de edição de disciplina
Quando ele altera o nome da disciplina, o ícone e o período
E clica no botão de salvar alterações
Então as informações da disciplina são atualizadas e redirecionado para a página de exibição da disciplina
```
---
##### 7. Excluir disciplina
**Como** administrador do app,
**Quero** poder excluir uma disciplina,
**Para que** eu possa remover disciplinas que não são mais necessárias.

**Critérios de aceitação:**
- O administrador pode excluir uma disciplina.
- O administrador deve confirmar a exclusão antes de prosseguir.

```
Dado que o administrador está na página de exibição da disciplina
Quando ele clica no botão de excluir disciplina
E confirma a exclusão
Então a disciplina é removida e redirecionado para a página inicial do app
```
---

#### Gerenciamento de Módulos

##### 2. Criar um Módulo
**Como** administrador do app,
**Quero** poder criar um novo módulo dentro de uma disciplina,
**Para que** eu possa organizar os conteúdos de acordo com os temas e níveis de dificuldade.


**Critérios de aceitação:**
- O administrador pode inserir o nome do módulo.
- O administrador pode adicionar uma descrição para o módulo (opcional).
- O administrador pode escolher o nível de dificuldade do módulo (básico, intermediário, avançado).

```
Dado que o administrador está na página de criação de módulo
Quando ele preenche o nome do módulo, a descrição e escolhe o nível de dificuldade
E clica no botão de criar módulo
Então o módulo é criado e redirecionado para uma página de exibição do módulo, para adicionar perguntas
```
---

##### 5. Editar módulo
**Como** administrador do app,  
**Quero** poder editar o nome, descrição e nível de dificuldade de um módulo,
**Para que** eu possa atualizar as informações conforme necessário.

**Critérios de aceitação:**
- O administrador pode editar o nome do módulo.
- O administrador pode alterar a descrição do módulo.
- O administrador pode modificar o nível de dificuldade do módulo.

```
Dado que o administrador está na página de edição de módulo
Quando ele altera o nome do módulo, a descrição e o nível de dificuldade
E clica no botão de salvar alterações
Então as informações do módulo são atualizadas e redirecionado para a página de exibição do módulo
```
---

##### 8. Excluir módulo
**Como** administrador do app,
**Quero** poder excluir um módulo,
**Para que** eu possa remover módulos que não são mais necessários.

**Critérios de aceitação:**
- O administrador pode excluir um módulo.
- O administrador deve confirmar a exclusão antes de prosseguir.

```
Dado que o administrador está na página de exibição do módulo
Quando ele clica no botão de excluir módulo
E confirma a exclusão
Então o módulo é removido e redirecionado para a página de exibição da disciplina
```
---

#### Gerenciamento de Perguntas

##### 3. Criar uma Pergunta
**Como** administrador do app,
**Quero** poder criar uma nova pergunta dentro de um módulo,
**Para que** eu possa oferecer quizzes interativos para os usuários.

**Critérios de aceitação:**
- O administrador pode inserir o enunciado da pergunta.
- O administrador pode adicionar as alternativas de resposta.
- O administrador pode marcar a alternativa correta.

```
Dado que o administrador está na página de criação de pergunta
Quando ele preenche o enunciado da pergunta e as alternativas de resposta
E marca a alternativa correta e clica no botão de criar pergunta
Então a pergunta é criada e redirecionado para a página de exibição do módulo
```
---

##### 6. Editar pergunta
**Como** administrador do app,
**Quero** poder editar o enunciado, alternativas e resposta correta de uma pergunta,
**Para que** eu possa corrigir ou atualizar as perguntas conforme necessário.

**Critérios de aceitação:**
- O administrador pode editar o enunciado da pergunta.
- O administrador pode alterar as alternativas de resposta.
- O administrador pode modificar a resposta correta.

```
Dado que o administrador está na página de edição de pergunta
Quando ele altera o enunciado da pergunta, as alternativas de resposta e a resposta correta
E clica no botão de salvar alterações
Então as informações da pergunta são atualizadas e redirecionado para a página de exibição do módulo
```
---

##### 9. Excluir pergunta
**Como** administrador do app,
**Quero** poder excluir uma pergunta,
**Para que** eu possa remover perguntas que não são mais necessárias.

**Critérios de aceitação:**
- O administrador pode excluir uma pergunta.
- O administrador deve confirmar a exclusão antes de prosseguir.

```
Dado que o administrador está na página de exibição da pergunta
Quando ele clica no botão de excluir pergunta
E confirma a exclusão
Então a pergunta é removida e redirecionado para a página de exibição do módulo
```
---

### Usuário

#### Visualização e Estudo

##### 10. Visualizar disciplina
**Como** usuário do app,
**Quero** poder visualizar as disciplinas disponíveis,
**Para que** eu possa escolher uma disciplina para estudar.

**Critérios de aceitação:**
- O usuário pode ver o nome da disciplina.
- O usuário pode ver o ícone da disciplina.
- O usuário pode ver o período da disciplina.

```
Dado que o usuário está na página inicial do app
Quando ele clica em uma disciplina
Então ele é redirecionado para a página de exibição da disciplina, para ver os módulos
```
---

##### 11. Visualizar módulos
**Como** usuário do app,
**Quero** poder visualizar os módulos de uma disciplina,
**Para que** eu possa escolher um módulo para estudar.

**Critérios de aceitação:**
- O usuário pode ver o nome do módulo.
- O usuário pode ver a descrição do módulo.
- O usuário pode ver o nível de dificuldade do módulo.

```
Dado que o usuário está na página de exibição da disciplina
Quando ele clica em um módulo
Então ele podera iniciar o quiz do módulo
```
---

##### 12. Responder perguntas
**Como** usuário do app,
**Quero** poder responder perguntas de um quiz,
**Para que** eu possa testar meus conhecimentos.

**Critérios de aceitação:**
- O usuário pode ver o enunciado da pergunta.
- O usuário pode ver as alternativas de resposta.
- O usuário pode escolher uma alternativa e confirmar a resposta.

```
Dado que o usuário está no quiz de um módulo
Quando ele responde uma pergunta
E clica no botão de confirmar resposta
Então ele recebe um feedback e pode avançar para a próxima pergunta
```
## Protótipo Baseado nas Histórias de Usuário
![image](https://github.com/user-attachments/assets/55f8b2d0-1ce9-4b78-b3c0-8d6dbb0a25fe)
![image](https://github.com/user-attachments/assets/cc2cfa41-ad48-4729-aacf-d377c211f799)
![image](https://github.com/user-attachments/assets/9d47d862-d2b7-42f0-b456-f0b60833947e)
![image](https://github.com/user-attachments/assets/2d887560-aaab-4617-aa1b-d562778c198d)
![image](https://github.com/user-attachments/assets/6093a001-13d8-432e-8cd8-62d919fa1476)
![image](https://github.com/user-attachments/assets/8f360308-1ae3-4eb1-bf64-058ac1ccb918)
![image](https://github.com/user-attachments/assets/952aeb07-a064-45c9-806a-0c1c83b247f0)
- Acesse-o para testar suas interações em: https://www.figma.com/design/uLxVGj8tXJdMrkRz757CHf/Aplicativo-M%C3%B3vel-de-Aprendizado?node-id=0-1&t=DF2C2DhIDVDda6ZK-1
---
