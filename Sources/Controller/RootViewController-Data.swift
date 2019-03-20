import Foundation
import UIKit

extension GameplayViewController {
    func addDummyData() {
//        cardInformationSet.append(CardInformation(title: "Batik", description: "Batik is a technique of wax-resist dyeing applied to whole cloth, or cloth made using this technique, originated from Indonesia, Batik is made either by drawing dots and lines of the resist with a spouted tool called a canting, or by printing the resist with a copper stamp called a cap. The applied wax resists dyes and therefore allows the artisan to colour selectively by soaking the cloth in one colour, removing the wax with boiling water, and repeating if multiple colours are desired.\n\n- Courtesy of Wikipedia -"))
//        cardInformationSet.append(CardInformation(title: "Kecak", description: "Kecak dance, known in Indonesian as Tari Kecak, is a form of Balinese hindu dance and music drama that was developed in the 1930s in Bali, Indonesia. Since its creation it has been performed primarily by men, with the very first women's kecak group starting in 2006. The dance mainly plays about the Ramayana and is traditionally performed in temples and villages across Bali.\n\n- Courtesy of Wikipedia -"))
//        cardInformationSet.append(CardInformation(title: "Rendang", description: "Rendang is a spicy meat dish which originated in Indonesia, especially the ethnic group of Minangkabau people, and is now commonly served across the country. One of the characteristic foods of Minangkabau culture, it is served at ceremonial occasions and to honour guests. Rendang is also served among the Malay community. Rendang is traditionally prepared by the Minangkabau community during festive occasions such as traditional ceremonies, wedding feasts and Hari Raya (Eid al-Fitr).\n\n- Courtesy of Wikipedia -"))
//        cardInformationSet.append(CardInformation(title: "Borobudur", description: "This famous Buddhist temple, dating from the 8th and 9th centuries, is located in central Java. It was built in three tiers: a pyramidal base with five concentric square terraces, the trunk of a cone with three circular platforms and, at the top, a monumental stupa. The walls and balustrades are decorated with fine low reliefs, covering a total surface area of 2,500 m2. Around the circular platforms are 72 openwork stupas, each containing a statue of the Buddha. The monument was restored with UNESCO's help in the 1970s\n\n- Courtesy of Wikipedia -"))
//        cardInformationSet.append(CardInformation(title: "Silat", description: "Pencak silat is an umbrella term for a class of related Indonesian martial arts. In neighbouring countries the term usually refers to professional competitive silat. It is a full-body fighting form incorporating strikes, grappling and throwing in addition to weaponry. Every part of the body is used and subject to attack. Pencak silat was practiced not only for physical defense but also for psychological ends\n\n- Courtesy of Wikipedia -"))
//        cardInformationSet.append(CardInformation(title: "Angklung", description: "The angklung is a musical instrument from Indonesia made of a varying number of bamboo tubes attached to a bamboo frame. The tubes are carved to have a resonant pitch when struck and are tuned to octaves, similar to Western handbells. The base of the frame is held in one hand, whilst the other hand shakes the instrument, causing a repeating note to sound. Each of three or more performers in an angklung ensemble play just one note or more, but altogether complete melodies are produced.\n\n- Courtesy of Wikipedia -"))
//        cardInformationSet.append(CardInformation(title: "Wayang", description: "Wayang, also known as Wajang, is a form of puppet theatre art found in Indonesia and other parts of Southeast Asia, wherein a dramatic story is told through shadows thrown by puppets and sometimes combined with human characters. The art form celebrates the Indonesian culture and artistic talent; its origins are traced to the spread of Hinduism in the medieval era and the arrival of leather-based puppet arts called Tholu bommalata from southern India.\n\n- Courtesy of Wikipedia -"))
        cardInformationSet.append(CardInformation(title: "Gamelan", description: "Gamelan is the traditional ensemble music of Java and Bali in Indonesia, made up predominantly of percussive instruments. The most common instruments used are metallophones played by mallets and a set of hand-played drums called kendhang which register the beat. Other instruments include xylophones, bamboo flutes, a bowed instrument called a rebab, and even vocalists called sindhen. Gamelan is still commonly played on formal occasions and in many traditional Indonesian ceremonies.\n\n- Courtesy of Wikipedia -"))
        
        cardInformationSet.forEach { (cardInfo) in
            self.cardInformationSet.append(cardInfo)
        }
        
        cardInformationSet.shuffle()
    }
}
