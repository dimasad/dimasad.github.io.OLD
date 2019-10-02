function err = fim_ent_senoidal(t, x, xponto)
u = 0.3 * sin(t);
err = fi(xponto, x, u);