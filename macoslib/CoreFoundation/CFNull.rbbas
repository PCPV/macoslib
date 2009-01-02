#tag Class
Class CFNull
Inherits CFType
Implements CFPropertyList
	#tag Event
		Function ClassID() As CFTypeID
		  return me.ClassID
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Reference() As Ptr
		  //overrides superclass method
		  
		  return CFNullRef
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CFNullGetTypeID lib Carbon.CarbonFramework () as CFTypeID
		    static id as CFTypeID = CFNullGetTypeID
		    return id
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewCFNullRef() As Ptr
		  dim carbonBundle as CFBundle = CFBundle.CarbonBundle
		  if carbonBundle is nil then
		    return nil
		  end if
		  
		  return CFBundle.CarbonFramework.DataPointer("kCFNull")
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			static theRef as Ptr = NewCFNullRef
			return theRef
			End Get
		#tag EndGetter
		Private Shared CFNullRef As Ptr
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
