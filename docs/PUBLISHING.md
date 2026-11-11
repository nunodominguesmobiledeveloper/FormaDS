# Distribuição e lançamento do FormaDS

## Estado atual de licenciamento

- Titular/licenciante indicado: **Nuno Domingues**.
- Contacto: **formadesignsystem@gmail.com**.
- O código e a documentação original FormaDS usam a licença MIT, com `Copyright (c) 2026 Nuno Domingues`.
- A MIT permite utilização pessoal e comercial, modificação, forks, redistribuição, sublicenciamento e venda, desde que os avisos exigidos sejam preservados.
- Continua pendente a confirmação factual de que todos os materiais originais podem ser licenciados por Nuno Domingues e não estão sujeitos a direitos de empregadores ou clientes.
- A proveniência e as licenças OFL-1.1 dos sete TTF estão documentadas em `ASSET_LICENSE_AUDIT.md`.
- Não criar tag, release pública ou pacote comercial enquanto estes bloqueios permanecerem.

## Recomendação
- Repositório **privado** com o código-fonte, testes, assets e Showcase.
- A distribuição pode usar o Swift Package de source atual ou um pacote binário. Avaliar **Swift Package com XCFramework** apenas por razões técnicas, de tamanho ou proteção operacional; a MIT permite acesso, modificação e redistribuição do código licenciado.
- O package de distribuição deve conter apenas os materiais necessários, avisos, termos e referência ao artefacto binário (nunca chaves privadas, source interno ou ficheiros de desenvolvimento).
- Um repositório público é compatível com MIT. Não apresentar acesso privado ou binários como forma de proibir direitos que a licença MIT concede aos destinatários.

## Fases de release
1. Obter confirmação factual de que o código original pode ser disponibilizado por Nuno Domingues sob MIT.
2. Auditar fontes, assets e dependências; incluir avisos de terceiros.
3. Verificar package, variantes iOS e iOS Simulator, recursos `.xcstrings`, fontes e API pública.
4. Validar com uma aplicação consumidora independente (não o Showcase).
5. Confirmar que o pacote distribuído inclui o `LICENSE`, `THIRD_PARTY_NOTICES.md` e os avisos OFL aplicáveis.
6. Criar release candidate e executar build/testes; gerar changelog.
7. Para fonte privada: criar tag semântica, autenticação por consumidor e política de acesso.
8. Para binário: gerar XCFramework, ZIP com artefacto na raiz, hospedar, calcular checksum SHA256 com `swift package compute-checksum`, declarar `.binaryTarget(name:url:checksum:)`, testar instalação limpa e acesso ao artefacto.
9. Só depois publicar tag `1.0.0` e GitHub Release. Não fazer automaticamente sem aprovação.

## Exemplo conceptual de manifest de distribuição BINÁRIA

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "FormaDS",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "FormaDS", targets: ["FormaDS"])
    ],
    targets: [
        .binaryTarget(
            name: "FormaDS",
            url: "https://EXEMPLO/RELEASE/FormaDS.xcframework.zip",
            checksum: "INSERIR_SHA256_REAL"
        )
    ]
)
```

**Não substituir o Package.swift atual por este exemplo.** É apenas a forma conceptual de distribuição; verificar integração de recursos e nome de módulo no artefacto real.

## Versões e monetização
- `1.0.0`: primeira versão estável licenciada.
- `1.0.1`: correções compatíveis.
- `1.1.0`: funcionalidades compatíveis.
- `2.0.0`: alterações incompatíveis.
- A MIT não exige preços, renovação, aceitação individual ou licença comercial separada.
- Versões já recebidas sob MIT conservam os direitos concedidos por essa licença; uma alteração futura de estratégia não retira retroativamente esses direitos.

## Fontes técnicas
- https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages
- https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle
