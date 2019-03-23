import Foundation
import UIKit

extension GameplayViewController {
    func addDummyData() {
//        cardInformationSet.append(CardInformation(title: "Batik", description: "A technique for clothing by applying wax-resist dye from Indonesia. Originally, Batik was Javanese tradition and used by people living in \"Keraton\" (royal palace in Javanese). Batik is created by drawing resist’s dots and lines by using drawing tool called \"canting\", or by printing the resist using \"cap\", a copper stamp. Today, batik can be made using various materials ranging from cotton to silk\n\nFun fact:\nBatik clothes are used commonly in Indonesia for formal events.", imageSource: "Agto Nugroho, Unsplash"))
//        cardInformationSet.append(CardInformation(title: "Kecak", description: "Tari Kecak or Kecak dance is a Balinese Hindu cultural art in form of dance and music. Kecak was developed in Bali, Indonesia, around the 1930s. The storyline of Kecak is mainly about Ramayana, one of two major ancient India’s epic. In performing Kecak, performers rise up their hands and shout out the famous \"cak cak cak...\"\n\nFun fact:\nKecak originated from a ritual where the persons were unconscious when performing.", imageSource: "Den, Unsplash"))
//        cardInformationSet.append(CardInformation(title: "Rendang", description: "Spicy, delicate, and very delicious meaty dish originating from Minangkabau, an ethnic group in West Sumatera, Indonesia. In Minangkabau culture, Rendang is served at ceremonies and to honour guests. Rendang is also served during festive occasions, wedding, and spiritual events such as Hari Raya (Eid al-Fitr).\n\nFun fact:\nCNN’s Reader’s Choice in 2011 and 2017 crowned Rendang for being the most delicious food!", imageSource: "Midori, Wikipedia"))
//        cardInformationSet.append(CardInformation(title: "Borobudur", description: "The world’s largest Buddhist temple located in Magelang, a city in Central Java, Indonesia. Borobudur was developed in three levels: a pyramidal base, a cone truck, and 72 monumental stupa at the top, each contains the Buddha’s statue. Borobudur was one of 7 wonders of the world.\n\nFun fact:\nWith total surface area covering 2,500 m2, Borobudur was built without any cement!", imageSource: "Sander Wehkamp, Unsplash"))
//        cardInformationSet.append(CardInformation(title: "Silat", description: "Indonesian local martial arts inspired by a woman named Rama Sukana beating a group of drunk people. Pencak Silat is a comprehensive martial arts ranging from full-body fighting to weaponry. Every part of the practitioner’s body is subject and used to attack. Pencak Silat is also practiced for psychological needs.\n\nFun fact:\nAsian Games in Indonesia was the first time for Pencak Silat being included in the competition.", imageSource: "Erisonjkambari, Wikipedia"))
//        cardInformationSet.append(CardInformation(title: "Angklung", description: "A musical instrument from Indonesia made of bamboo frame with attaching bamboo tubes. Every tube is set to have resonant pitch when struck and tuned, similar to handbells is Western culture. In Angklung ensemble, every three or more people play one note or more. However, with everybody involved, the complete melodies are produced.\n\nFun fact:\nAngklung is put on the \"Representative List of the Intangible Cultural Heritage of Humanity\" of UNESCO in 2010.", imageSource: "Sulfur, Wikipedia"))
//        cardInformationSet.append(CardInformation(title: "Wayang", description: "A traditional puppet show from Indonesia and other parts of Southeast Asia, Wayang is performed in a dramatic storyline and told through shadows. This art celebrates artistic talent and Indonesian culture. Wayang is tightly relevant with the spread of Hinduism in middle age and the arrival of \"Tholu Bommalata\" (leather puppet arts) in South India.\n\nFun fact:\nThere are many types of Wayang in Indonesia and two most popular are Wayang Golek (made of wood) and Wayang Kulit (made of cow’s skin).", imageSource: "Rebecca Marshall, Wikipedia"))
        cardInformationSet.append(CardInformation(title: "Gamelan", description: "Traditional music ensemble of Java and Bali that primarily consists of percussive instruments. The most common instruments are kind of metallophones for producing melody and \"Kendang\" for arranging music’s tempo. At some occasions, Gamelan may perform with a vocalist called \"Sinden\". The song you are currently listening to is an example of Gamelan.\n\nFun fact:\nGamelan has been used to treat people with mental disorder.", imageSource: "Fir0002/Flagstaffotos, Wikipedia"))
        
        cardInformationSet.forEach { (cardInfo) in
            self.cardInformationSet.append(cardInfo)
        }
        
        cardInformationSet.shuffle()
    }
}
