# FormaDS — Third-Party Notices

The FormaDS proprietary license does not relicense the third-party materials listed below. Their original terms prevail.

## Sora

- Files: `Sora-Regular.ttf`, `Sora-SemiBold.ttf`, `Sora-Bold.ttf`
- Bundled copyright notice: Copyright 2019 The Sora Project Authors (`https://github.com/sora-xor/sora-font`)
- License: SIL Open Font License 1.1 (OFL-1.1)
- Bundled notice: `LICENSES/Sora-OFL.txt`
- Official upstream: `https://github.com/sora-xor/sora-font`
- Pinned commit: `7f9a9c5d0ccd1c099cfac420aa27133df1c5fdc4`
- Source directory: `https://github.com/sora-xor/sora-font/tree/7f9a9c5d0ccd1c099cfac420aa27133df1c5fdc4/fonts/ttf`
- Reserved Font Names: none declared in the bundled OFL notice
- Modification status: upstream static TTF files are redistributed unchanged; repository filenames match the upstream filenames

## Manrope

- Files: `Manrope-Regular.ttf`, `Manrope-Medium.ttf`, `Manrope-SemiBold.ttf`, `Manrope-Bold.ttf`
- Bundled copyright notice: Copyright 2018 The Manrope Project Authors (`https://github.com/googlefonts/manrope`)
- License: SIL Open Font License 1.1 (OFL-1.1)
- Bundled notice: `LICENSES/Manrope-OFL.txt`
- Official upstream: `https://github.com/googlefonts/manrope`
- Pinned commit: `468c0dbe38efa331b80bfe9448256abe27be44c3`
- Source directory: `https://github.com/googlefonts/manrope/tree/468c0dbe38efa331b80bfe9448256abe27be44c3/fonts/ttf`
- Reserved Font Names: none declared in the bundled OFL notice
- Modification status: upstream static TTF bytes are redistributed unchanged; the lowercase upstream filenames were normalized to the existing FormaDS resource capitalization, without modifying font data

The two files in `LICENSES/` are byte-for-byte copies of the OFL notices at the pinned upstream commits and of the notices stored beside the font binaries in `Sources/FormaDS/Resources/Fonts/`. Binary hashes and direct source URLs are recorded in `docs/ASSET_LICENSE_AUDIT.md`.

## Apple frameworks and SF Symbols

FormaDS references SF Symbols by system symbol name through SwiftUI. No exported SF Symbol artwork, SVG or PDF was found in the audited repository. Apple frameworks and symbols remain subject to Apple's applicable terms and usage guidelines.

## Package dependencies and other media

`Package.swift` declares no external package dependency and no `Package.resolved` exists. The asset catalogs contain metadata and empty App Icon/Accent Color sets only; no image payloads were found. The PNG files under `Integration/FormaDSConsumerValidation/Evidence/phase-14.7/` are project validation screenshots, not package resources.

See `docs/ASSET_LICENSE_AUDIT.md` for the audited inventory, hashes, evidence and remaining blockers.
