use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let npt = (prova1 + prova2) / 2.0;
    let pf = npt * 0.6 + redacao * 0.4;

    if pf >= 60.0 {
        println!("Parabéns! Candidato aprovado no processo seletivo.");
    } else {
        println!("Infelizmente o candidato não atingiu a pontuação mínima de aprovação.");
    }

    pf
}

fn main() {
    let mut entrada = String::new();

    println!("Digite a nota da Prova Teórica 1:");
    io::stdin().read_line(&mut entrada).unwrap();
    let prova1: f64 = entrada.trim().parse().unwrap();

    entrada.clear();
    println!("Digite a nota da Prova Teórica 2:");
    io::stdin().read_line(&mut entrada).unwrap();
    let prova2: f64 = entrada.trim().parse().unwrap();

    entrada.clear();
    println!("Digite a nota da Redação:");
    io::stdin().read_line(&mut entrada).unwrap();
    let redacao: f64 = entrada.trim().parse().unwrap();

    let pontuacao_final = calcular_pontuacao(prova1, prova2, redacao);

    println!("Pontuação Final: {:.2}", pontuacao_final);
}
