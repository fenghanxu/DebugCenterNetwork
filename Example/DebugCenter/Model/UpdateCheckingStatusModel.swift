class UpdateCheckingStatusModel: Codable {

    var message: String?
    var data: UpdateCheckingStatusDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class UpdateCheckingStatusDataModel: Codable {


}
