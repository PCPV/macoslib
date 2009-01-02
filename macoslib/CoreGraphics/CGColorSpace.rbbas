#tag Class
Class CGColorSpace
Inherits CFType
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Function CreateWithName(name as String) As CGColorSpace
		  soft declare function CGColorSpaceCreateWithName lib CarbonFramework (name as CFStringRef) as Ptr
		  
		  dim p as Ptr = CGColorSpaceCreateWithName(name)
		  if p = nil then
		    return nil
		  end if
		  
		  return new CGColorSpace(p, true)
		  
		  //pass one of the ColorSpace* constants to create a color space
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  soft declare function CGColorSpaceGetTypeID lib CarbonFramework () as CFTypeID
		  
		  return CGColorSpaceGetTypeID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GenericGray() As CGColorSpace
		  return CreateWithName(ColorspaceGenericGray)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GenericRGB() As CGColorSpace
		  return CreateWithName(ColorspaceGenericRGB)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			soft declare function CGColorSpaceGetNumberOfComponents lib CarbonFramework (cs as Ptr) as Integer
			
			return CGColorSpaceGetNumberOfComponents(me)
			End Get
		#tag EndGetter
		ComponentCount As Integer
	#tag EndComputedProperty


	#tag Constant, Name = ColorSpaceGenericGray, Type = String, Dynamic = False, Default = \"kCGColorSpaceGenericGray", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ColorSpaceGenericRGB, Type = String, Dynamic = False, Default = \"kCGColorSpaceGenericRGB", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ColorSpaceGenericCMYK, Type = String, Dynamic = False, Default = \"kCGColorSpaceGenericCMYK", Scope = Public
	#tag EndConstant


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
		#tag ViewProperty
			Name="ComponentCount"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
