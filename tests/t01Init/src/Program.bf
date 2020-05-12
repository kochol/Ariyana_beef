using System;
using ari;

namespace t01Init
{
	class Program
	{
		public static void Main()
		{
			var setup = scope GfxSetup();
			Gfx.SetupGfx(setup);
			while (Io.Run())
			{
				Io.UpdateIo();
			}
		}

	}
}
