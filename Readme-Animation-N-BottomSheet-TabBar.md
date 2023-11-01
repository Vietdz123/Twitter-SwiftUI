# Animation and BottomSheet and TabBar

# I. Animation

## 1.1 Animation 2 View

Để animation 2 View ko liên quan đến nhau, ta có thể sử dụng `@Namespace` và modifier `matchedGeometryEffect`:

## 1.2 Animation trong cùng 1 View



# II. Moving views with DragGesture and offset()

`SwiftUI` cho phép ta custom gestures bất kì 1 view nào. Ở đây ta sẽ sử dụng `DragGesture` để có thể moved và rotate 1 view. Đầu tiên ta cần một biến để track offset user đã moved và rotate như nào:

```swift
@State private var offset = CGSize.zero
```

Fullcode:


```swift
struct MoveView: View {
    @State private var offset = CGSize.zero
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(Double(offset.width / 5)))
                .opacity(2 - Double(abs(offset.width / 50)))
                .offset(x: offset.width, y: 0)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            print("DEBUG: \(gesture.translation) translation")
                            print("DEBUG: \(gesture.location) location")
                            offset = gesture.translation
                        }
                        .onEnded { gesture in
                            offset = .zero
                        }
                )
            
            Spacer()
        }
    }
}
```

# V. Reference

1. [How to add and remove views with a transition](https://www.hackingwithswift.com/quick-start/swiftui/how-to-add-and-remove-views-with-a-transition)
2. [How to use gestures in SwiftUI](https://www.hackingwithswift.com/books/ios-swiftui/how-to-use-gestures-in-swiftui)