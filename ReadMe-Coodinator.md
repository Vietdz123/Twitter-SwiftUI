# Wrapping a UIViewController in a SwiftUI view

Các bước để Import 1 `ViewController` vào trong `SwiftUI`, ở đây ta sẽ thêm `UIImagePickerController` vào trong `SwiftUI`, và hứng data sau khi pick ảnh

- Đầu tiên ta tạo struct `ImagePicker` comform kiểu `UIViewControllerRepresentable`, để comform với `UIViewControllerRepresentable`, ta cần implement 2 protocol `makeUIViewController()` và `updateUIViewController()`

```swift
struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
```

Sau đó ta chỉ cần present View đó lên là được:

```swift
    .sheet(isPresented: $showingImagePicker) {
        ImagePicker()
    }
```

- Tuy nhiên sau khi pick Image, ta ko nhận được image sau khi pick, đó là ta ko `delegate UIImagePickerController` để hứng data. Nhớ lại rằng ngày xưa ta triển khải 1 `ViewController A`, xong từ `A` ta tiến hành delegate `imgPickerVC = UIImagePickerController()` (`imgPickerVC.delegate = self`) để hứng data sau khi pick ảnh. Bây giờ nhiệm vụ của ta cũng là triển khai 1 class mà `comform với UIImagePickerController` để hứng Image. Bây giờ ta sẽ tiến hành triển khai 1 class mà comform với `UINavigationControllerDelegate, UIImagePickerControllerDelegate ` để hứng data từ `UIImagePickerController`.

```swift
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.dismiss) var dismiss
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

extension ImagePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {return}
            parent.selectedImage = image
            parent.dismiss()
        }
        
    }
    
}
```

Từ dòng code này `picker.delegate = context.coordinator`, lúc này sau khi pick Image, thì thằng `coordinator` sẽ là thằng xử lý `delegate`, sau đó gán Image pick được thông qua binding.
