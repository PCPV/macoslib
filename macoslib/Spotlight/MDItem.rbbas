#tag Class
Class MDItem
Inherits CFType
	#tag Method, Flags = &h0
		Function Attribute(key as String) As CFType
		  #if targetMacOS
		    soft declare function MDItemCopyAttribute lib CarbonFramework (item as Ptr, name as CFStringRef) as Ptr
		    
		    return CFType.NewObject(MDItemCopyAttribute(me, key))
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ClassID() As CFTypeID
		  #if targetMacOS
		    
		    soft declare function MDItemGetTypeID lib CarbonFramework () as CFTypeID
		    
		    static id as CFTypeID = MDItemGetTypeID
		    return id
		  #endif
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributeNames() As String()
		  #if targetMacOS
		    soft declare function MDItemCopyAttributeNames lib CarbonFramework (item as Ptr) as Ptr
		    
		    dim theArray as new CFArray(MDItemCopyAttributeNames(me), true)
		    if theArray = nil then
		      dim noList() as String
		      return noList
		    end if
		    
		    dim theList() as String
		    dim lastIndex as Integer = theArray.Count - 1
		    for i as Integer = 0 to lastIndex
		      dim item as new CFString(theArray.Value(i), false)
		      theList.Append item
		    next
		    
		    return theList
		  #endif
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			InheritedFrom="CFType"
		#tag EndViewProperty
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
