## How to use Pruu's Shaders

### G1

**What to look for in material files:** `/EE/Shaders/Deferred/MetalFillDeferred.hlsl`

- Comes with separate Diffuse, Specular, and Roughness maps (Roughness map may be missing, so check Material file for Shine and Gloss attributes).
- Use the 'G2 Split Shader' to set up 'G1'.
- In the 'Sh. PBR Map Splitter' node group, switch 'Separate...' to 1 and plug in the corresponding textures.
- If no Roughness map is available, use the 'Separate Roughness Map' and manually input values, typically between 0.4–0.5.
- In 99.99% of cases, the Specular Map is essentially the Metal Map, which will usually be set to 0.
- Manually adjust 'Additional Metalness' (typically from a Map Range based on the Specular map values or the fourth tint channel).
- Set 'Wetness Amount' to 0 if no Roughness map is available.

### G2

**Shader Path:** `/EE/Shaders/Deferred/PBRFillDeferred.hlsl`

- Uses a PackMap and stores tints in the Alpha channel.
- Two PBR types:
  - If the Red channel is Specular, set 'Specular Map is Metal Map' to 0.
  - If the Red channel is Metalness, set 'Specular Map is Metal Map' to 1.
- You need to manually switch the 'Specular Map is Metal Map' toggle based on the current setup.
- If 'Specular Map is Metal Map' is set to 0, input 'Additional Metalness' manually from the red channel, tints, or another source, as automatic setup is not available.

### G3

**Shader Path:** `/EE/Shaders/Deferred/CharacterFillDeferred.hlsl`

- Available in two types: the Blue channel of the PackMap can be either AO or Diffuse. Use the 'Blue Channel is AO Map' toggle to switch.
- Check the Material file for specifics.
- Most 'G3' data comes from microdetails. Model uniqueness (wear, grunge, etc.) is controlled under the 'Grunge' tab.
- Key Grunge settings include:

  - 'Grunge Red' and 'Grunge Green' under the 'Grunge' tab for model-wide control.
  - 'Blue Color Strength' and 'Blue Color' control the Blue channel in the PackMap. Default is 1 (set to 0 to disable).
  - 'Macro Roughness Amount' controls the Alpha map affecting roughness (check for the 'MACRO_ROUGHNESS' command in the material file).
  - 'Microdetail Grime Threshold' controls grime added from microdetails.
  - Various controls for grime textures stored in Red and Green channels affect colors, specular, metallic, and roughness.

  **Note:** Most grunge settings beyond 'Grunge Global' are optional and add extra detail, but models work fine without them.

### Additional Switches

- **(G2) 'Tint Map Stored in Alpha':** Set to 0 if tints have a separate texture, or 1 if stored in the PackMap Alpha channel.
- **(G3) 'RGB Tint Map':** Use 1 if the Tint map lacks an Alpha channel. Referred to as `TINT_MASK_RGBA` or `TINT_MASK_RGB`.
- **'Fix Broken Normal Orientation':** Set to 1 if automatic conversion flips Red and Green channels, creating visible seams.
- **'Strength':** Adjusts Normal Map strength (default: 1).
- **'Channel as Emission Mask' and 'Channel as Emission Effect':** Toggle 0 (no emission), 1 (Red channel emission), or 2 (Green channel emission).
- **'Emission Strength':** Adjust emission brightness.
- **(G3) 'Use Material Tint Map':** Set to 1 to enable inputs for separate Tint textures in Microdetails.
- **'Specular Value':** Manual input for specular values when PBR type is 1 (default: 0.5).
- **'Vertex Ambient Occlusion':** Input for V.AO stored in mesh data. Unplugging disables it entirely.
- **'Wetness Amount':** Converts Roughness Map from Non-Color to sRGB (default: 1).
- **'Microdetail':** For G2, referred to as `DETAIL_MAP_ATLAS`; for G3, it’s always present. Adjust values as needed.
- **'Colors':** Self-explanatory.

### Final Tweaks

- **'AO Influence':** Adjusts how much AO affects the final look. Uses AO from mesh data.
- **'Diffuse Tweak':** Adjusts brightness between 'G2' and 'G3' models for color consistency.

If using 'G3' models with Atlas Detail textures (seen in Pink Frame setups), you can either remove them and set them manually or use them as-is.

### Final Notes

- Tints are in sRGB (though non-color in the shader), but using sRGB makes baking impossible.
- Any texture named 'SpecGloss' is not PBR-compatible and needs editing.
- G2 models can work with either a joined or separate Detail Atlas. Plug in manually for G2 shaders.
- Specular in the material file is used as a color, but Blender doesn’t support specular as a color. Use the mean value instead (e.g., `[0.1, 0.1, 0.1, 1]` becomes 0.1).

**_More to come..._**
