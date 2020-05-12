using System;

namespace ari
{
	public static class Io
	{
		[CLink]
		public static extern void UpdateIo();

		[CLink]
		public static extern bool Run();
	}

}
