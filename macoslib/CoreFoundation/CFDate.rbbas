#tag Class
Class CFDate
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(absTime as Double)
		  #if TargetMacOS
		    soft declare function CFDateCreate lib CarbonFramework (allocator as Ptr, at as Double) as Ptr
		    
		    me.Adopt CFDateCreate(nil, absTime), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(d as Date)
		  if d is nil then
		    d = new Date
		  end if
		  
		  me.Constructor d.TotalSeconds - AbsoluteTimeIntervalSince1904
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Date
		  dim d as new Date
		  d.TotalSeconds = me.AbsoluteTime + AbsoluteTimeIntervalSince1904
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AbsoluteTime() As Double
		  #if TargetMacOS
		    soft declare function CFDateGetAbsoluteTime lib CarbonFramework (theDate as Ptr) as Double
		    
		    return CFDateGetAbsoluteTime(me.Reference)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CFDateGetTypeID lib CarbonFramework () as CFTypeID
		    static id as CFTypeID = CFDateGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			#if targetMacOS
			static value as Double
			
			static initialized as Boolean = false
			if not initialized then
			initialized = true // if it doesn't work the first time, there's no need to try again, or is there?
			const kCFAbsoluteTimeIntervalSince1904 = "kCFAbsoluteTimeIntervalSince1904"
			dim p as Ptr = CFBundle.CarbonFramework.DataPointer(kCFAbsoluteTimeIntervalSince1904)
			if p <> nil then
			value = p.Double(0)
			end if
			end if
			
			return value
			#endif
			End Get
		#tag EndGetter
		Private Shared AbsoluteTimeIntervalSince1904 As Double
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
