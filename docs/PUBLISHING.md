# Distribuição e lançamento do FormaDS

## Estado atual de licenciamento

- Titular/licenciante indicado: **Nuno Domingues**.
- Contacto: **formadesignsystem@gmail.com**.
- A licença proprietária continua em minuta: faltam data efetiva, lei/foro aplicável, processo de aceitação e revisão jurídica.
- A auditoria não confirmou a distribuição exata dos sete TTF incluídos. Resolver o bloqueio documentado em `ASSET_LICENSE_AUDIT.md` antes de qualquer distribuição externa.
- Não criar tag, release pública ou pacote comercial enquanto estes bloqueios permanecerem.

## Recomendação
- Repositório **privado** com o código-fonte, testes, assets e Showcase.
- Preparar pacote de distribuição separado. Avaliar **Swift Package com XCFramework** para distribuir binário e reduzir exposição do source original.
- O package de distribuição deve conter apenas os materiais necessários, avisos, termos e referência ao artefacto binário (nunca chaves privadas, source interno ou ficheiros de desenvolvimento).
- Um repositório público com a licença proprietária não impede tecnicamente cópia/fork; restringe direitos conforme lei e termos. Para maior controlo, distribuir acesso privado/autenticado e considerar binários.

## Fases de release
1. Obter declaração de titularidade do código original e revisão jurídica do `LICENSE`.
2. Auditar fontes, assets e dependências; incluir avisos de terceiros.
3. Verificar package, variantes iOS e iOS Simulator, recursos `.xcstrings`, fontes e API pública.
4. Validar com uma aplicação consumidora independente (não o Showcase).
5. Testar Personal/Commercial onboarding e como se comprova aceitação da licença; usar `formadesignsystem@gmail.com` como contacto de licenciamento.
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
- Definir preços/licenças para novas versões ou novos clientes; não assumir que alterar termos futuros extingue direitos validamente concedidos em versões anteriores.
- Definir o que acontece às aplicações compiladas e distribuídas quando uma licença paga expira, para evitar conflitos com clientes.

## Fontes técnicas
- https://developer.apple.com/documentation/xcode/distributing-binary-frameworks-as-swift-packages
- https://developer.apple.com/documentation/xcode/creating-a-multi-platform-binary-framework-bundle
