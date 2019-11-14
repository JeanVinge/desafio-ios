// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {

  public enum Product {
    /// Starting at  
    public static let priceStartingAt = L10n.tr("localizable", "product.price-starting-at")
  }

  public enum Tabbar {
    /// In city
    public static let icTheCity = L10n.tr("localizable", "tabbar.ic-the-city")
    /// Products
    public static let products = L10n.tr("localizable", "tabbar.products")
    /// Travels
    public static let travels = L10n.tr("localizable", "tabbar.travels")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
