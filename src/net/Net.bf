using System;

namespace ari
{
	public static class Net
	{
		[CLink]
		public static extern bool InitNetwork();

		[CLink]
		public static extern void ShutdownNetwork();
	}
}
