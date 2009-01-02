#tag Class
Class CGImageSource
Inherits CFType
	#tag Method, Flags = &h0
		Sub Constructor(url as CFURL)
		  if url = nil then
		    return
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageSourceCreateWithURL lib CarbonFramework (url as Ptr, options as Ptr) as Ptr
		    
		    me.Adopt CGImageSourceCreateWithURL(url, nil), true
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    soft declare function CGImageSourceGetTypeID lib CarbonFramework () as CFTypeID
		    
		    return CGImageSourceGetTypeID
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Image(index as Integer) As CGImage
		  if me = nil then
		    return new CGImage(nil)
		  end if
		  
		  #if targetMacOS
		    soft declare function CGImageSourceCreateImageAtIndex lib CarbonFramework (isrc as Ptr, index as Integer, options as Ptr) as Ptr
		    
		    return new CGImage(CGImageSourceCreateImageAtIndex(me, index, nil), true)
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			if me = nil then
			return 0
			end if
			
			#if targetMacOS
			soft declare function CGImageSourceGetCount lib CarbonFramework  (isrc as Ptr) as Integer
			
			return CGImageSourceGetCount(me)
			#endif
			End Get
		#tag EndGetter
		Count As Integer
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
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
