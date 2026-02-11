#!/usr/bin/env python3
"""
Generador de logo hexagonal para Nahomi Commander
Ejecutar: python3 generate_logo.py
"""

import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

def create_nahomi_logo(output_file='nahomi_logo.png'):
    """Crea logo hexagonal tipo panal"""
    
    fig, ax = plt.subplots(figsize=(5, 5), dpi=300)
    ax.set_aspect('equal')
    
    # Fondo suave
    ax.set_facecolor('#ffffff')
    
    # Crear múltiples hexágonos (efecto panal)
    radius = 0.18
    center_x, center_y = 0.5, 0.5
    
    # Posiciones para panal
    positions = [
        (center_x, center_y),           # Centro
        (center_x + radius*1.5, center_y),  # Derecha
        (center_x - radius*1.5, center_y),  # Izquierda
        (center_x + radius*0.75, center_y + radius*1.3),  # Arriba derecha
        (center_x - radius*0.75, center_y + radius*1.3),  # Arriba izquierda
        (center_x + radius*0.75, center_y - radius*1.3),  # Abajo derecha
        (center_x - radius*0.75, center_y - radius*1.3),  # Abajo izquierda
    ]
    
    # Dibujar cada hexágono
    colors = ['#2C3E50', '#3498DB', '#2980B9', '#2C3E50', '#3498DB', '#2980B9', '#2C3E50']
    
    for i, (x, y) in enumerate(positions):
        hexagon = patches.RegularPolygon(
            (x, y), 6, radius=radius,
            orientation=np.pi/6,  # 30 grados
            fill=True, alpha=0.9,
            facecolor=colors[i % len(colors)],
            edgecolor='#eaeaea', linewidth=2
        )
        ax.add_patch(hexagon)
    
    # Texto NAHOMI en el hexágono central
    ax.text(center_x, center_y - 0.005, 'N', fontsize=24, color='white',
            fontweight='bold', ha='center', va='center',
            fontfamily='DejaVu Sans')
    
    # Texto alrededor
    ax.text(center_x, center_y + 0.23, 'NAHOMI', fontsize=16,
            color='#000000', ha='center', va='center',
            fontweight='bold', fontfamily='DejaVu Sans Mono')
    
    ax.text(center_x, center_y - 0.25, 'CNC FRAMEWORK', fontsize=10,
            color='#2C3E50', ha='center', va='center',
            fontfamily='DejaVu Sans')
    
    # Líneas de conexión (como trayectorias CNC)
    for i in range(1, len(positions)):
        ax.plot([center_x, positions[i][0]], 
                [center_y, positions[i][1]], 
                '#eaeaea', linewidth=1.5, alpha=0.7)
    
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)
    ax.axis('off')
    
    # Guardar
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight', 
                facecolor=ax.get_facecolor())
    plt.close()
    
    print(f"✅ Logo guardado como: {output_file}")
    print(f"   Tamaño: 1500x1500 px (5x5 pulgadas @ 300 DPI)")

if __name__ == "__main__":
    # Ejecutar si se llama directamente
    create_nahomi_logo()
    
    # También generar versión pequeña para favicon
    create_nahomi_logo('nahomi_favicon.png')
    print("\n🎨 Logo listo para GitHub, CV y documentación!")
