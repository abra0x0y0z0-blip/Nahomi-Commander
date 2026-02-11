# Nahomi Commander - Framework CNC

<div align="center">
  
  ![Logo Nahomi](docs/images/logo.png)
  
  **Framework de macros CNC modular | Probado en Haas VF5 | Licencia MIT**
  
  *"Donde la precisión encuentra la dulzura"*
  
  [![Licencia MIT](https://img.shields.io/badge/Licencia-MIT-blue.svg)](LICENSE.txt)
  [![Español](https://img.shields.io/badge/Idioma-Español-orange.svg)](README.md)
  [![Versión](https://img.shields.io/badge/Versión-1.0.0-green.svg)](CHANGELOG.md)
  
</div>
## 🤝 Contribuir

¿Encontraste un error? ¿Tienes una mejora?
1. Haz **Fork** del proyecto
2. Crea tu rama: `git checkout -b mi-mejora`
3. Haz commit: `git commit -m 'Añadí X función'`
4. Haz push: `git push origin mi-mejora`
5. Abre un **Pull Request**

## ❓ Preguntas Frecuentes

**¿Funciona en otras máquinas además del VF5?**
✅ Sí, cualquier control compatible con Fanuc Macro B (Fanuc, Haas, Okuma, etc.)

**¿Necesito conocimientos avanzados de macros?**
❌ No, Nahomi abstrae la complejidad. Solo define parámetros.

**¿Puedo usarlo en producción comercial?**
✅ Sí, licencia MIT permite uso comercial sin restricciones.

## 📞 Soporte

- **Issues en GitHub**: Reporta bugs o solicita funciones
- **Email**: (abra0x0y0z0@gmail.com)
- **Foros**: CNCzone, Practical Machinist (buscando Nahomi)
---

<div align="center">
  
  ### 📊 Estadísticas del Proyecto
  
  ```yaml
  Líneas de código: 850+
  Funciones: 12
  Parámetros: 15+
  Coordenadas en array: 50
  Máquinas probadas: Haas VF3, VF4, VF5, VF7, TM3p
  Años en desarrollo: 1+


## 🚀 Comenzar en 30 segundos

```nc
O1000 (EJEMPLO_BÁSICO)
G90 G40 G49 G80
G21

(G65 P8000 W[función] T[herramienta] S[RPM] Z[profundidad] R[retracción])
G65 P8000 W1. T1 S1800 Z-12. R3. F0.15 A0. C4.

M30
