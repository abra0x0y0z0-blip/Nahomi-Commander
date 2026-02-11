# Nahomi Commander - Framework CNC

<div align="center">
  
  ![Logo Nahomi](docs/images/logo.png)
  
  **Framework de macros CNC modular | Probado en Haas VF5 | Licencia MIT**
  
  *"Donde la precisión encuentra la dulzura"*
  
  [![Licencia MIT](https://img.shields.io/badge/Licencia-MIT-blue.svg)](LICENSE.txt)
  [![Español](https://img.shields.io/badge/Idioma-Español-orange.svg)](README.md)
  [![Versión](https://img.shields.io/badge/Versión-1.0.0-green.svg)](CHANGELOG.md)
  
</div>

## 🚀 Comenzar en 30 segundos

```nc
O1000 (EJEMPLO_BÁSICO)
G90 G40 G49 G80
G21

(G65 P8000 W[función] T[herramienta] S[RPM] Z[profundidad] R[retracción])
G65 P8000 W1. T1 S1800 Z-12. R3. F0.15 A0. C4.

M30
