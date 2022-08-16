//
//  UIImageExtensions.swift
//  Werdle MessagesExtension
//
//  Created by Andrew Carvajal on 8/2/22.
//

import UIKit

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        
        // determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        return scaledImage
    }
    
    func scaledSystemImage(named systemImageName: String, size: CGSize, weight: UIImage.SymbolWeight, color: UIColor? = nil) -> UIImage {
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: weight, scale: .medium)
        var image = UIImage(systemName: systemImageName, withConfiguration: config)!
        
        if let color = color {
            image = image.withTintColor(color)
        }
        
        return image.scalePreservingAspectRatio(targetSize: size)
    }
}
