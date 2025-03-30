import SwiftUI

enum Colors {
    // Brand Colors
    static let primary = Color.blue
    static let primaryLight = Color.blue.opacity(0.8)
    static let primaryDark = Color.blue.opacity(0.6)
    
    // Semantic Colors
    static let success = Color.green
    static let warning = Color.yellow
    static let error = Color.red
    static let info = Color.blue
    
    // Text Colors
    static let text = Color.primary
    static let textSecondary = Color.secondary
    
    // Background Colors
    static let background = Color(.systemBackground)
    static let secondaryBackground = Color(.secondarySystemBackground)
    
    // Button Colors
    static let buttonPrimary = Color.blue
    static let buttonSecondary = Color(.systemGray5)
    static let buttonDisabled = Color(.systemGray3)
} 