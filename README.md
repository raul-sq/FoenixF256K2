# SuperBASIC Trigonometry (Foenix F256K2)

This SuperBASIC program calculates **sine**, **cosine**, and **tangent** for any input angle in **degrees** on the Foenix F256K2.

It uses:
- **Quadrant reduction** to fold any angle into the **first quadrant** (`0°–90°`),
- A truncated **Taylor series** for `sin(x)` (up to the x⁷ term),
- Complementary-angle identities to derive `cos(x)`,
- A simple ratio to compute `tan(x)`.

**How it Works**

Input: The program asks for an angle in degrees.

Quadrant reduction: Angles are reduced by subtracting 90° repeatedly until they fall within 0–90°.

Series expansion:

Uses sin(x) ≈ x − x³/3! + x⁵/5! − x⁷/7! with x in radians.

Cosine calculation: Derived from the complementary angle (cos θ = sin(90°−θ)), with sign adjustments by quadrant.

Tangent: Computed as sin / cos.
