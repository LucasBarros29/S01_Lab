use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("\n--- Números no intervalo terminados em {} ---", digito);

    for numero in limite_inferior..=limite_superior {
        if numero % 10 == digito {
            println!("{}", numero);
        }
    }
}

fn main() {
    let mut entrada = String::new();

    println!("Digite o dígito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada).unwrap();
    let digito: i32 = entrada.trim().parse().unwrap();

    entrada.clear();
    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada).unwrap();
    let limite_inferior: i32 = entrada.trim().parse().unwrap();

    entrada.clear();
    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada).unwrap();
    let limite_superior: i32 = entrada.trim().parse().unwrap();

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
