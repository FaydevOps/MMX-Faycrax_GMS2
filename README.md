# MMX Maverick's Fury (GMS2)

Fan game de acción y plataformas 2D inspirado en la saga *Mega Man X*, desarrollado en **GameMaker** (GML). Proyecto no oficial y sin ánimo de lucro.

## Requisitos

- **GameMaker** 2024.13 o superior (el proyecto se guardó con el IDE `2024.13.1.193`).
- Windows es el objetivo principal; el proyecto incluye opciones para Linux, macOS, HTML5, Android, iOS, tvOS y Opera GX, pero no se han probado.

## Cómo abrir y ejecutar

1. Clona el repositorio:
   ```powershell
   git clone https://github.com/FaydevOps/MMX-Faycrax_GMS2
   ```
2. Abre `MMX-MavericksFury_GMS2.yyp` con GameMaker.
3. Pulsa **Run** (F5). La primera room del orden de ejecución es `main_rooms`.

## Estructura del proyecto

| Carpeta | Contenido |
|---|---|
| `objects/` | ~510 objetos: personajes jugables, enemigos, jefes, proyectiles, efectos, HUD y menús |
| `scripts/` | ~119 scripts GML: físicas, hitboxes, daño, input, opciones, paletas y compatibilidad con funciones antiguas de GM |
| `sprites/` | ~1700 sprites (personajes, fondos, efectos, interfaz) |
| `rooms/` | 23 rooms: menús, carga, intro, niveles y salas de jefe |
| `sounds/` | ~180 sonidos: música (`BGM_*`) y efectos (`SFX_*`) |
| `tilesets/` | Tilesets de cada escenario |
| `shaders/` | Escalado, cambio de paleta y filtros (gris, sepia, térmico, Game Boy) |
| `timelines/` | Secuencias de ataque de jefes (p. ej. `clawboss`) |
| `fonts/` | Fuentes del juego |
| `options/` | Configuración por plataforma |

### Personajes jugables

`MegamanX`, `Zero`, `Axl` y `Vile` (objetos con el mismo nombre).

### Rooms principales

- **Menús y flujo:** `MainMenu`, `ConfigMenu`, `OptionsMenu`, `StartGame`, `StageStart`, `WeaponGet`, `NowLoading`, `NowLoading2`
- **Intro / niveles:** `intro_zero`, `flame1`
- **Jefes:** `vsahera`, `vsdouble`, `vsdyna`, `vsflameburst`, `vsgeemel`, `vshighmax`, `vssolarstarfish`, `vsspiketurtoroid`, `vsspinelswamp`, `vsvampire`, `vszain`
- **Pruebas:** `testingroom`

### Scripts clave

| Script | Función |
|---|---|
| `init_player`, `init_enemy` | Inicialización de jugador y enemigos |
| `scr_motion*`, `scr_ene_motion` | Movimiento y físicas |
| `scr_hitbox_*`, `scr_damage*`, `boss_hit` | Hitboxes y daño |
| `input_check`, `check_joybtn`, `joystick_*` | Entrada de teclado y mando |
| `load_options`, `save_options` | Carga/guardado de configuración en `config.ini` |
| `pal_swap_*` | Sistema de cambio de paletas (con `shd_pal_swapper`) |
| `__init_*`, `__view_*`, `__background_*`, `d3d_*` | Capa de compatibilidad con funciones de GameMaker Studio 1 |
| `macros` | Resolución de la vista: `VIEWSIZE_X = 352`, `VIEWSIZE_Y = 224` |

## Controles por defecto

Se pueden cambiar en el menú de configuración y se guardan en `config.ini`.

| Acción | Teclado | Mando (XInput) |
|---|---|---|
| Moverse | Flechas | Stick / cruceta |
| Saltar | `C` | A (`gp_face1`) |
| Disparar | `X` | X (`gp_face3`) |
| Dash | `D` | B (`gp_face2`) |
| Especial | `S` | Y (`gp_face4`) |
| Cambiar arma | `A` | RB |
| Seleccionar / OK | `Z` | LB |
| Pausa | `Enter` | Start |

## Configuración (`config.ini`)

Secciones que guarda el juego: `Screen` (pantalla completa, escala, VSync), `Sound` (volumen de efectos y música), `Control` (teclas, mando y DInput) e idioma.

## Licencia

Código bajo **GNU GPL v3** (ver [LICENSE](LICENSE)).

*Mega Man X* y sus personajes son propiedad de Capcom. Este es un proyecto de fans sin relación con Capcom; los recursos derivados de la saga no están cubiertos por la licencia GPL.
