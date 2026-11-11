# Auditoria de propriedade intelectual e licenças de terceiros

**Data da auditoria:** 11 de novembro de 2026  
**Âmbito:** conteúdo atualmente presente no repositório FormaDS  
**Titular indicado para os materiais originais FormaDS:** Nuno Domingues (`formadesignsystem@gmail.com`)

Esta é uma auditoria técnica de inventário e proveniência, não um parecer jurídico. A titularidade de contribuições, condições laborais/contratuais e validade da licença proprietária exigem confirmação do titular e, antes de distribuição externa, revisão jurídica.

## Resultado resumido

| Recurso | Evidência encontrada | Licença/termos | Estado |
|---|---|---|---|
| Código, tokens, temas e documentação FormaDS | Ficheiros Swift/Markdown do repositório; nenhum aviso de terceiro encontrado no source | Licença proprietária FormaDS em minuta | Titular indicado; revisão jurídica pendente |
| Sora (3 TTF) | TTF estáticos do upstream oficial fixado por commit; hashes e nomes PostScript verificados | OFL-1.1 | Proveniência e licença confirmadas |
| Manrope (4 TTF) | TTF estáticos do upstream oficial fixado por commit; hashes e nomes PostScript verificados | OFL-1.1 | Proveniência e licença confirmadas |
| SF Symbols | Nomes referenciados via APIs SwiftUI; nenhum símbolo exportado | Termos Apple | Sem payload redistribuído encontrado |
| Frameworks Apple | SwiftUI, Foundation, CoreGraphics, CoreText e UIKit | Termos Apple/Xcode SDK | Referências de plataforma, não dependências empacotadas |
| Packages externos | `Package.swift` sem dependências; sem `Package.resolved` | Não aplicável | Nenhum encontrado |
| Asset catalogs | Apenas `Contents.json`; sem imagens de ícone/accent | Conteúdo do projeto | Sem asset gráfico externo encontrado |
| Screenshots de validação | 9 PNG em `Integration/.../Evidence/phase-14.7/` | Evidência produzida pelo projeto | Não fazem parte dos recursos do package |
| SVG/PDF/JPEG/GIF/WebP/animações | Pesquisa do repositório | Não aplicável | Nenhum encontrado |
| Código externo adaptado | Pesquisa por avisos/licenças e inspeção da estrutura | Desconhecido se existir sem marcação | Nenhuma evidência encontrada; confirmação humana pendente |

## Fontes incluídas

### Sora

- Upstream oficial: `https://github.com/sora-xor/sora-font`.
- Commit fixado: `7f9a9c5d0ccd1c099cfac420aa27133df1c5fdc4` (5 de setembro de 2022).
- Diretório de origem: `fonts/ttf/` nesse commit; foram usadas variantes estáticas, não a fonte variável.
- Aviso oficial: `OFL.txt` no mesmo commit; Copyright 2019 The Sora Project Authors (`https://github.com/sora-xor/sora-font`).

| Ficheiro | Peso | PostScript | Versão | SHA-256 anterior | SHA-256 oficial atual |
|---|---:|---|---:|---|---|
| `Sora-Regular.ttf` | Regular | `Sora-Regular` | `131072` | `647631fce2f0cda4e5e87209bbd6a96b18042577d8917075e75b2eeb901ca9cd` | `517e945dedbeeb8d700ccae77d189a6ef2a01f6dcc95ba5d032ef9a30f7f0de9` |
| `Sora-SemiBold.ttf` | SemiBold | `Sora-SemiBold` | `131072` | `a566f4a4e9ba8ee5c06b341305f63dddedc11348765d33ec8a65d905c0148e8b` | `b02621d4009da9a18eb8a5cbe277f084eb9c3f065ba08a6e77769e81863becf2` |
| `Sora-Bold.ttf` | Bold | `Sora-Bold` | `131072` | `7917122683e80cb2f3dcea1efd2381a4b2c010501e64ffe0b28c739751118867` | `2ee62953668346b0aff83994a7864f75ee6b8443f99894e88f47559454291155` |

`LICENSES/Sora-OFL.txt` e `Sources/FormaDS/Resources/Fonts/OFL Sora.txt` são cópias byte-a-byte do `OFL.txt` oficial fixado; SHA-256 `ba0b9729c9428ba79a0459ab8ec575791b51509dbec213e383d0316d37fec299`. Não existem Reserved Font Names declarados no aviso.

### Manrope

- Upstream oficial: `https://github.com/googlefonts/manrope`.
- Commit fixado: `468c0dbe38efa331b80bfe9448256abe27be44c3` (14 de setembro de 2026).
- Diretório de origem: `fonts/ttf/` nesse commit; foram usadas variantes estáticas, não a fonte variável.
- Aviso oficial: `OFL.txt` no mesmo commit; Copyright 2018 The Manrope Project Authors (`https://github.com/googlefonts/manrope`).

| Ficheiro FormaDS | Ficheiro upstream | Peso | PostScript | Versão | SHA-256 anterior | SHA-256 oficial atual |
|---|---|---:|---|---:|---|---|
| `Manrope-Regular.ttf` | `manrope-regular.ttf` | Regular | `Manrope-Regular` | `295240` | `6383bd9f81e56d61139884d8e42cb7b2146a11dde4efde55c8bff1e4c2c0bbe8` | `d23d6eedf51dd495138aa1a83588027d4a63549cdfcc2fa5e0d8e84e09cf4cb1` |
| `Manrope-Medium.ttf` | `manrope-medium.ttf` | Medium | `Manrope-Medium` | `295240` | `88d3f8ef004b53483a202772d09acaab17ca99dd41905d9b4ab07ac635632378` | `502ee33a6e140ad6ef10ef8b762a8e5cf01f33316f318800795725f4cfd539d9` |
| `Manrope-SemiBold.ttf` | `manrope-semibold.ttf` | SemiBold | `Manrope-SemiBold` | `295240` | `abbefa1f58c7355b663c19f29ffe4cd7fc8c93a9e5f8b68f08d1e9ba2bc4ba0d` | `f43edb46a08e1538413ea2383ef01ed93cdab191a2c57d2489d9590985858cf7` |
| `Manrope-Bold.ttf` | `manrope-bold.ttf` | Bold | `Manrope-Bold` | `295240` | `4aed5d180a4f41ed21f07e678486f889bb40eb0ddf5f473769b6302f507d1e36` | `484d10f0683e9e9f588de978f70cd3ad17cb3522bc0ca6efc4491c83429d323c` |

Os nomes dos ficheiros upstream foram normalizados apenas na capitalização para preservar os nomes dos recursos FormaDS; os bytes TTF não foram alterados. `LICENSES/Manrope-OFL.txt` e `Sources/FormaDS/Resources/Fonts/OFL.txt` são cópias byte-a-byte do `OFL.txt` oficial fixado; SHA-256 `58172e0c0fac2cda8a37b348164bb55e44b0e69051e557e92b1d3f6910141f7b`. Não existem Reserved Font Names declarados no aviso.

### Decisão de substituição e referências no código

Os hashes anteriores não foram tratados como prova de modificação. Foram comparados com as variantes estáticas atuais e com as revisões disponíveis no histórico dos mesmos caminhos upstream; não foi encontrada correspondência que permitisse atribuir uma distribuição exata. Por isso, os sete binários foram substituídos por ficheiros oficiais fixados acima.

As referências funcionais permanecem inalteradas: `DSFontRegistry` regista os sete recursos; `DSTypographyToken` resolve Manrope para corpo/controlo e Sora para headings/display; o Showcase regista e demonstra as famílias; `TypographyTests` exige os sete nomes PostScript. A substituição preserva nomes de recurso, família, peso e PostScript e não altera a API pública.

### Validação após substituição

- O Swift Package compilou com sucesso no Xcode.
- Foram executados 117 testes: 117 passaram, sem falhas, skips ou testes não executados. Estes incluem o registo dos recursos e a disponibilidade dos sete nomes PostScript.
- A compilação e execução do Showcase foram confirmadas manualmente no Xcode após a substituição.
- A galeria de tipografia foi validada manualmente em Light/Dark e com Dynamic Type elevado. Não foram observados fallbacks, truncamentos ou diferenças visuais problemáticas.

## Evidência técnica

- `Package.swift` define apenas os targets locais `FormaDS` e `FormaDSTests` e processa `Sources/FormaDS/Resources`.
- Não existe `Package.resolved`, logo não foram encontradas dependências SwiftPM diretas ou transitivas fixadas.
- Imports encontrados: `SwiftUI`, `Foundation`, `CoreGraphics`, `CoreText`, `UIKit`, `XCTest` e o próprio módulo `FormaDS`.
- Os catálogos de assets do Showcase e da app de integração não contêm payloads gráficos.
- A pesquisa não encontrou SVG, PDF, JPEG, GIF, WebP ou ficheiros de animação.

## Bloqueios antes de publicação externa

1. Confirmar por declaração do titular que o código, temas, documentação, screenshots e exemplos originais podem ser licenciados por Nuno Domingues e não incorporam material de empregador/cliente ou código copiado sem aviso.
2. Obter revisão jurídica da licença proprietária, definir data efetiva, lei aplicável, foro e mecanismo de aceitação.
3. Confirmar disponibilidade e política da designação/marca `FormaDS`; esta auditoria não efetuou pesquisa de marca.

Enquanto estes pontos não forem resolvidos, os documentos devem permanecer em estado de minuta e o repositório não deve ser apresentado como pronto para distribuição pública.
