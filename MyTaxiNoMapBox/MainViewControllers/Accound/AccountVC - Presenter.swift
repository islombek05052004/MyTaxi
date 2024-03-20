//
//  AccountVC - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit

protocol AccoundVCPresenter {
    
    func presentImagePickerVC()
    func updateAccoundImage(image: UIImage)
}

extension AccountViewController: AccoundVCPresenter {
    
    func updateAccoundImage(image: UIImage) {
        
        guard let accountImageView = view.viewWithTag(AccoundTableHeaderViewTags.imagePerson.rawValue) as? UIImageView else { return }
        
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            accountImageView.image = image
        }
    }
    
    func presentImagePickerVC() {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.allowsEditing = true
        imagePickerVC.modalPresentationStyle = .fullScreen
        imagePickerVC.delegate = self
        
        present(imagePickerVC, animated: true)
    }
}


extension AccountViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
    
    if let image = info[.editedImage] as? UIImage {
        dismiss(animated: true)
        updateAccoundImage(image: image)
        UserDefaultsManager.shared.saveAccountImage(image: image)
    }
}
}

