# Guía para Contribuir

¡Gracias por considerar contribuir a Nahomi Commander!

## Cómo Reportar un Error
1. Ve a [Issues](https://github.com/abra0x0y0z0-blip/Nahomi-Commander/issues)
2. Haz clic en "New Issue"
3. Describe:
   - Qué función falla (W1, W2, etc.)
   - Parámetros usados
   - Mensaje de error (si hay)
   - Controlador CNC y máquina

## Añadir Nueva Función
1. Revisa la estructura existente en `src/NahomiCommander.nc`
2. Sigue el patrón: `N[numero]` para nuevas funciones
3. Documenta en `docs/Ayuda.txt`
4. Añade ejemplo en `examples/`

## Estándares de Código
- Comentarios en español
- Variables #100-#199 para cálculos temporales
- Validación de todos los parámetros (#3000 para errores)
