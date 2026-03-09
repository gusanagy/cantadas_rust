use colored::*;
use rand::seq::SliceRandom; // Para escolher itens aleatórios

struct Cantada {
    desc: &'static str,
}

fn main() {
    // Lista de cantadas
    let cantadas = vec![
        "Gata(o), você é uma constante em um mar de variáveis!",
        "Você não é pacote no NPM, mas quero te adicionar nas dependências do meu coração.",
        "Posso te chamar de CSS? Porque eu gosto do seu estilo.",
        "[me != me]. [me += you]",
        "Você me ganhou no ‘Hello World’...",
        "Nosso amor está no ar, graças ao Wi-Fi",
        "Não sou Linux, mas estou livre",
        "Com você até o Word fica sem palavras",
        "Você é o Internet Explorer? Porque com você meu layout fica completamente desconfigurado!",
        "Deixa eu ser a instância da sua classe love no seu objeto heart?",
        "Você não é CSS, mas é puro estilo",
        "Antes de começarmos a namorar eu preciso declarar algumas variáveis",
        "Você não é objeto, mas eu amei seus atributos",
        "Você não é orientado a objetos, mas é cheio de classe",
        "Casa comigo que eu te dou domínio, hospedagem e suporte personalizado",
        "Você é a chave estrangeira da minha entidade coração",
        "Você não é um MacOS X, mas é o sistema mais bem composto de beleza que eu já vi",
        "Você não é um código de programação bem feito, mas dispensa comentários",
        "Não importa em qual plataforma você foi feito, eu me adequo ao seu sistema",
        "Se você fosse uma variável, seria um ponteiro que aponta para o endereço de memória do meu coração",
        "Gata(o), Ate_me_aquivo_quer_que_voce.mpeg",
        "Entre tantas variáveis, você é uma constante no meu coração.",
        "Você é o CSS do meu código HTML.",
        "Gata(o), perto de você, eu sou como o Internet Explorer. Só de olhar pra mim que eu já travo.",
        "Gata, você é o ” ; ” que falta no meu código.",
        "Gata(o) você foi feita(o) em JAVA? Porque você ocupa toda minha memória...",
        "Me chama de ponteiro e deixa eu acessar a sua memória.",
        "Toda vez que você passa pela minha função dá bug geral no meu sistema.",
        "Você é uma solução muito robusta, para um sistema simplificado como o meu.",
    ];

    let emojis = vec![
        "(*°○°*)♡", "↖(^o^)↗", "(。♡‿♡。)", "ʕ•̫͡•ʔ♡ʕ•̫͡•ʔ", 
        "ʕ•̫͡•ʔ❤ʕ•̫͡•ʔ", "ο(^_^)ο♡彡", "(*˘︶˘*).。.:*♡", "(♡ര‿ര)"
    ];

    // Decorações
    let border = "♡ﾟ･｡｡･ﾟ♡ﾟ･｡♥｡･ﾟ♥ ♡ﾟ･｡｡･ﾟ♡ﾟ･｡♥｡･ﾟ♥ ♡ﾟ･｡｡･ﾟ♡ﾟ･｡♥｡･ﾟ♥".truecolor(242, 0, 137);
    
    // Lógica de seleção aleatória
    let mut rng = rand::thread_rng();
    let cantada_escolhida = cantadas.choose(&mut rng).unwrap_or(&"Erro ao compilar amor.");
    let emoji_escolhido = emojis.choose(&mut rng).unwrap_or(&"♡");

    // Impressão estilizada (Simulando o Boxen)
    println!("\n{}\n", border);
    println!("  {}  {}  {}", emoji_escolhido.cyan(), cantada_escolhida.white().bold(), emoji_escolhido.cyan());
    println!("\n{}\n", border);
}
