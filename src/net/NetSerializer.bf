using System;

namespace ari
{
	public static class NetSerializer
	{
		// bool
		[CLink]
		static extern bool SerializeBool(void* _stream, bool* _val);
		[CLink]
		static extern bool SerializeMeasureBool(void* _stream, bool* _val);
		[CLink]
		static extern bool DeserializeBool(void* _stream, bool* _val);
		
		// int32
		[CLink]
		static extern bool SerializeInt32(void* _stream, int* _val);
		[CLink]
		static extern bool SerializeMeasureInt32(void* _stream, int* _val);
		[CLink]
		static extern bool DeserializeInt32(void* _stream, int* _val);
		
		// uint32
		[CLink]
		static extern bool SerializeUint32(void* _stream, uint32* _val);
		[CLink]
		static extern bool SerializeMeasureUint32(void* _stream, uint32* _val);
		[CLink]
		static extern bool DeserializeUint32(void* _stream, uint32* _val);
		
		// uint64
		[CLink]
		static extern bool SerializeUint64(void* _stream, uint64* _val);
		[CLink]
		static extern bool SerializeMeasureUint64(void* _stream, uint64* _val);
		[CLink]
		static extern bool DeserializeUint64(void* _stream, uint64* _val);
		
		// float
		[CLink]
		static extern bool SerializeFloat(void* _stream, float* _val);
		[CLink]
		static extern bool SerializeMeasureFloat(void* _stream, float* _val);
		[CLink]
		static extern bool DeserializeFloat(void* _stream, float* _val);
		
		// double
		[CLink]
		static extern bool SerializeDouble(void* _stream, double* _val);
		[CLink]
		static extern bool SerializeMeasureDouble(void* _stream, double* _val);
		[CLink]
		static extern bool DeserializeDouble(void* _stream, double* _val);
		
		// string
		[CLink]
		static extern bool SerializeString(void* _stream, char8* _val, int* _size);
		[CLink]
		static extern bool SerializeMeasureString(void* _stream, char8* _val, int* _size);
		[CLink]
		static extern bool DeserializeString(void* _stream, char8* _val, int* _size);
		
		// bits
		[CLink]
		static extern bool SerializeBits(void* _stream, void* _val, int* _size);
		[CLink]
		static extern bool SerializeMeasureBits(void* _stream, void* _val, int* _size);
		[CLink]
		static extern bool DeserializeBits(void* _stream, void* _val, int* _size);
		
		// bytes
		[CLink]
		static extern bool SerializeBytes(void* _stream, void* _val, int* _size);
		[CLink]
		static extern bool SerializeMeasureBytes(void* _stream, void* _val, int* _size);
		[CLink]
		static extern bool DeserializeBytes(void* _stream, void* _val, int* _size);
		
		// Generic
		public static bool Serialize<T>(void* _stream, T _val)
		{
			var c = _val;
			return SerializeUint32(_stream,  (uint32*)&c);
		}

		public static bool SerializeMeasure<T>(void* _stream, T _val)
		{
			var c = _val;
			return SerializeMeasureUint32(_stream, (uint32*)&c);
		}

		public static bool Deserialize<T>(void* _stream, T _val)
		{
			var c = _val;
			return DeserializeUint32(_stream, (uint32*)&c);
		}

		public static bool Serialize(void* _stream, uint32* _val)
		{
			return SerializeUint32(_stream, _val);
		}

		public static bool SerializeMeasure(void* _stream, uint32* _val)
		{
			return SerializeMeasureUint32(_stream, _val);
		}

		public static bool Deserialize(void* _stream, uint32* _val)
		{
			return DeserializeUint32(_stream, _val);
		}

	}
}
