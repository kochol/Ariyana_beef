using System;

namespace ari
{
	public static class Gfx
	{
		[CLink]
		public static extern bool SetupGfx(GfxSetup* setup);
	}
}
