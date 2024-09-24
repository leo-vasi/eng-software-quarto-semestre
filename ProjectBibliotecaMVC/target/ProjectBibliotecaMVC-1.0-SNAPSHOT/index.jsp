<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Página Inicial</title>
        <link href="assets/css/styles.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <div class="container">
                <h1>Bem-vindo à Biblioteca</h1>
                <p>Gerencie os livros disponíveis no sistema.</p>
            </div>
        </header>

        <main>
            <div class="container">
                <a href="LivroController?action=list" class="button" aria-label="Ver todos os livros disponíveis">Ver Todos os Livros</a>
            </div>
        </main>
    </body>
</html>
