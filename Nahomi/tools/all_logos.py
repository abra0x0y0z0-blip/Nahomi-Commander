#!/usr/bin/env python3
"""
Genera TODAS las versiones del logo Nahomi Commander
Ejecutar: python3 generate_all_logos.py
"""

import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np
from PIL import Image
import os

def create_logo_variant(colors, bg_color, filename, size=1500):
    """Crea una variante del logo con colores específicos"""
    
    dpi = 300
    figsize = size / dpi
    
    fig, ax = plt.subplots(figsize=(figsize, figsize), dpi=dpi)
    ax.set_aspect('equal')
    ax.set_facecolor(bg_color)
    
    # Parámetros del panal
    radius = 0.18 * (size / 1500)  # Escalar con tamaño
    center_x, center_y = 0.5, 0.5
    
    # Posiciones de los hexágonos (panal)
    positions = [
        (center_x, center_y),
        (center_x + radius*1.5, center_y),
        (center_x - radius*1.5, center_y),
        (center_x + radius*0.75, center_y + radius*1.3),
        (center_x - radius*0.75, center_y + radius*1.3),
        (center_x + radius*0.75, center_y - radius*1.3),
        (center_x - radius*0.75, center_y - radius*1.3),
    ]
    
    # Dibujar hexágonos
    for i, (x, y) in enumerate(positions):
        hexagon = patches.RegularPolygon(
            (x, y), 6, radius=radius,
            orientation=np.pi/6,
            fill=True, alpha=0.9,
            facecolor=colors[i % len(colors)],
            edgecolor='white' if bg_color == '#2C3E50' else '#2C3E50',
            linewidth=2 * (size / 1500)
        )
        ax.add_patch(hexagon)
    
    # Texto y conexiones (solo en versiones grandes)
    if size >= 500:
        # Color del texto basado en fondo
        text_color = 'white' if bg_color == '#2C3E50' else '#2C3E50'
        detail_color = '#95A5A6' if bg_color == '#2C3E50' else '#7F8C8D'
        
        # 'N' central
        ax.text(center_x, center_y - 0.005, 'N', fontsize=24 * (size/1500),
                color=text_color, fontweight='bold',
                ha='center', va='center', fontfamily='DejaVu Sans')
        
        # 'NAHOMI' arriba
        ax.text(center_x, center_y + 0.23, 'NAHOMI',
                fontsize=16 * (size/1500), color=text_color,
                fontweight='bold', ha='center', va='center',
                fontfamily='DejaVu Sans Mono')
        
        # 'CNC FRAMEWORK' abajo
        ax.text(center_x, center_y - 0.25, 'CNC FRAMEWORK',
                fontsize=10 * (size/1500), color=detail_color,
                ha='center', va='center', fontfamily='DejaVu Sans')
        
        # Líneas de conexión
        line_color = 'white' if bg_color == '#2C3E50' else '#3498DB'
        for i in range(1, len(positions)):
            ax.plot([center_x, positions[i][0]],
                    [center_y, positions[i][1]],
                    color=line_color, linewidth=1.5 * (size/1500),
                    alpha=0.7)
    
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)
    ax.axis('off')
    
    # Crear directorio si no existe
    os.makedirs('media/logos', exist_ok=True)
    
    # Guardar
    output_path = f'media/logos/{filename}'
    plt.tight_layout(pad=0)
    plt.savefig(output_path, dpi=dpi, bbox_inches='tight',
                facecolor=ax.get_facecolor(), transparent=True)
    plt.close()
    
    return output_path

def create_favicon():
    """Crea favicon.ico con múltiples tamaños"""
    
    sizes = [16, 32, 48, 64]
    images = []
    
    for size in sizes:
        fig, ax = plt.subplots(figsize=(size/100, size/100), dpi=100)
        ax.set_aspect('equal')
        ax.set_facecolor('transparent')
        
        # Solo hexágono central para favicon
        hexagon = patches.RegularPolygon(
            (0.5, 0.5), 6, radius=0.4,
            orientation=np.pi/6,
            fill=True, alpha=0.9,
            facecolor='#2C3E50',
            edgecolor='white', linewidth=0.5
        )
        ax.add_patch(hexagon)
        
        # 'N' pequeña
        ax.text(0.5, 0.5, 'N', fontsize=size/3,
                color='white', fontweight='bold',
                ha='center', va='center',
                fontfamily='DejaVu Sans')
        
        ax.set_xlim(0, 1)
        ax.set_ylim(0, 1)
        ax.axis('off')
        
        # Guardar temporalmente
        temp_file = f'temp_{size}.png'
        plt.tight_layout(pad=0)
        plt.savefig(temp_file, dpi=100, bbox_inches='tight',
                    facecolor='transparent', transparent=True)
        plt.close()
        
        # Abrir con PIL y añadir a lista
        img = Image.open(temp_file)
        images.append(img)
        os.remove(temp_file)
    
    # Guardar como .ico
    images[0].save('media/logos/nahomi-favicon.ico',
                   format='ICO', sizes=[(s, s) for s in sizes],
                   append_images=images[1:])

def main():
    """Genera todas las versiones del logo"""
    
    print("🔄 Generando logotipos Nahomi Commander...")
    print("=" * 50)
    
    # 1. Logo color (fondo claro)
    colors_light = ['#2C3E50', '#3498DB', '#2980B9',
                    '#2C3E50', '#3498DB', '#2980B9', '#2C3E50']
    path1 = create_logo_variant(colors_light, '#FFFFFF',
                                'nahomi-logo-color.png', 1500)
    print(f"✅ Logo color: {path1}")
    
    # 2. Logo blanco (para fondos oscuros)
    colors_white = ['#FFFFFF', '#F8F9FA', '#E9ECEF',
                    '#FFFFFF', '#F8F9FA', '#E9ECEF', '#FFFFFF']
    path2 = create_logo_variant(colors_white, '#2C3E50',
                                'nahomi-logo-white.png', 1500)
    print(f"✅ Logo blanco: {path2}")
    
    # 3. Logo negro (para impresión)
    colors_black = ['#000000', '#212121', '#424242',
                    '#000000', '#212121', '#424242', '#000000']
    path3 = create_logo_variant(colors_black, '#FFFFFF',
                                'nahomi-logo-black.png', 1500)
    print(f"✅ Logo negro: {path3}")
    
    # 4. Social preview (1280x640)
    fig, ax = plt.subplots(figsize=(12.8, 6.4), dpi=100)
    ax.set_facecolor('#2C3E50')
    
    # Logo más a la izquierda
    radius = 0.8
    positions = [
        (2.5, 3.2),  # Centrado verticalmente
        (2.5 + radius*1.5, 3.2),
        (2.5 - radius*1.5, 3.2),
        (2.5 + radius*0.75, 3.2 + radius*1.3),
        (2.5 - radius*0.75, 3.2 + radius*1.3),
        (2.5 + radius*0.75, 3.2 - radius*1.3),
        (2.5 - radius*0.75, 3.2 - radius*1.3),
    ]
    
    for i, (x, y) in enumerate(positions):
        hexagon = patches.RegularPolygon(
            (x, y), 6, radius=radius,
            orientation=np.pi/6,
            fill=True, alpha=0.9,
            facecolor=['#FFFFFF', '#F8F9FA', '#E9ECEF',
                       '#FFFFFF', '#F8F9FA', '#E9ECEF', '#FFFFFF'][i % 7],
            edgecolor='#2C3E50', linewidth=3
        )
        ax.add_patch(hexagon)
    
    # Texto a la derecha
    ax.text(8, 4.5, 'NAHOMI COMMANDER', fontsize=36,
            color='white', fontweight='bold',
            fontfamily='DejaVu Sans Mono')
    
    ax.text(8, 3.2, 'CNC Framework', fontsize=24,
            color='#BDC3C7', fontfamily='DejaVu Sans')
    
    ax.text(8, 2, 'Open-source • Modular • Production-proven', fontsize=16,
            color='#7F8C8D', fontfamily='DejaVu Sans')
    
    ax.text(2.5, 3.2, 'N', fontsize=48,
            color='#2C3E50', fontweight='bold',
            ha='center', va='center', fontfamily='DejaVu Sans')
    
    ax.set_xlim(0, 12.8)
    ax.set_ylim(0, 6.4)
    ax.axis('off')
    
    plt.tight_layout(pad=0)
    plt.savefig('media/logos/nahomi-social-preview.png',
                dpi=100, bbox_inches='tight')
    plt.close()
    print("✅ Social preview: media/logos/nahomi-social-preview.png")
    
    # 5. Favicon
    create_favicon()
    print("✅ Favicon: media/logos/nahomi-favicon.ico")
    
    # 6. Logo pequeño para CV (300x300)
    create_logo_variant(colors_light, '#FFFFFF',
                        'nahomi-logo-small.png', 300)
    print("✅ Logo pequeño: media/logos/nahomi-logo-small.png")
    
    print("\n" + "=" * 50)
    print("🎉 ¡Todos los logos generados exitosamente!")
    print("\n📁 Archivos creados en: media/logos/")
    print("   • nahomi-logo-color.png    (Para documentos)")
    print("   • nahomi-logo-white.png    (Para fondos oscuros)")
    print("   • nahomi-logo-black.png    (Para impresión B/N)")
    print("   • nahomi-social-preview.png (Para GitHub/Redes)")
    print("   • nahomi-favicon.ico       (Para el navegador)")
    print("   • nahomi-logo-small.png    (Para CV/Email)")

if __name__ == "__main__":
    # Verificar que matplotlib esté instalado
    try:
        import matplotlib
        main()
    except ImportError:
        print("❌ Error: Necesitas instalar matplotlib")
        print("   Ejecuta: pip3 install matplotlib")
        print("   O: sudo apt install python3-matplotlib")
