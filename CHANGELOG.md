## 0.0.3

### Fixed
- Moved `flutter_lints` to `dev_dependencies`.
- Resolved `intl` package version compatibility issue.
- Fixed web compilation errors due to mismatched constant names in `int_constants_web.dart`.
- Updated conditional export from `dart.library.js` to `dart.library.js_interop`.
- Removed duplicate exports of `int_constants_io.dart` and `int_constants_web.dart` from barrel file.

### Changed
- Added `library dart_extensions_pro;` declaration to the main barrel file.
- Reorganized barrel file exports into logical groups.

### Updated
- `flutter_lints` upgraded to `^6.0.0`.
- `collection` upgraded to `^1.19.1`.

---

## 0.0.2
### Added
- Extensions for vertical and horizontal scroll support for widgets.
- Object alignment extensions for aligning widgets to:
  - Top
  - Bottom
  - Left
  - Right
  - Center
- `space` extension added to simplify spacing between widgets
- `hBox` and `wBox` extensions for creating fixed-sized empty boxes in layouts.
- Padding shortcuts:
  - `pH`: Adds horizontal padding.
  - `pV`: Adds vertical padding.

### Changed
- Simplified and renamed several extension method names and parameters:
  - For example, `paddingSymmetric` renamed to `pSymmetric` for brevity and clarity.

---
## 0.0.1

* Version 1.0.0 introduces a dart package that provides handy extensions and helper functions, designed to simplify and speed up development, making coding more efficient and streamlined.