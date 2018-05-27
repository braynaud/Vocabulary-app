//
//  AppDelegate.swift
//  Vocab
//
//  Created by Basile Raynaud on 1/6/18.
//  Copyright © 2018 Basile Raynaud. All rights reserved.
//

import UIKit

var dictionary = [String: String]()
var list = [String]()
var filteredList = [String]()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		let words: String = """
		Tremulous: shaking or quivering slightly; timid, nervous

		Thumb: (as v) press, move, or touch (something) with one's thumb; use one's thumb to indicate something; turn over (pages) with or as if with one's thumb; wear or soil (a book's pages) by repeated handling; request or obtain (a free ride in a passing vehicle) by signaling with one's thumb

		Basin: a wide open container used for preparing food or for holding liquid; (Brit) a bowl for washing, typically attached to a wall and having taps connected to a water supply; a circular or oval valley or natural depression on the earth's surface, esp. containing water; hollow, fully, ravine, gorge, dip; the tract of country drained by a river and its tributaries, or which drains into a lake or sea; the enclosed area of water where boat can be moored; a circumscribed rock formation where the strata dip towards the center

		Crewel: a thin, loosely twisted, worsted yarn used for tapestry and embroidery

		Truckle: (v) submit or behave obsequiously; kowtow, pander, toady, grovel; (n) a small barrel-shaped cheese, especially cheddar

		Furbish: give a fresh look to (something old and shabby.) renovate; (archaic) brighten up (a weapon) by polishing ut

		Vizard: (archaic) a mask or disguise

		Venial: denoting a son that is not regarded as depriving the soul of divine grace; (of a fault or offense) slight and pardonable

		Minister: (n) a head of a government department; a member of the clergy, esp. in the Presbyterian and nonconformist Churches; a diplomatic agent, usually ranking below an ambassador; (archaic) a person or thing used to achieve or convey something; (v) attend to the needs of (someone); (archaic) provide (something necessary or helpful); act as a minister of religion; administer (a sacrament)

		Cicerone: a guide who gives information about places of interest to sightseers (ety: after Marcus Tullius Cicero, apparently alluding humorously to his eloquence and learning)

		Modicity: (archaic) moderateness

		Applausive: (obsolete) applaudable; (archaic) expressing approval or applause

		In petto: (a, adv) in secret. Private; (Roman Catholicism) designated as a cardinal but not yet announced

		Custodian: a person who has responsibility for taking care of or protecting something; warden, warder, keeper, guardian, steward; (US) a person employed to clean and maintain a building; (Brit, humorous) a goalkeeper or wicketkeeper

		Ab ovo: from the very beginning (ety: Latin meaning "from the very beginning")

		Exercitation: the act or an instance of exercising

		Tenor: a singing voice between baritone and alto or countertenor, the highest of the ordinary adult male voice; an instrument, especially a saxophone, trombone, tuba, or viol, of the second or third lowest pitch in its family

		Baritone: an adult male range singing voice between tenor and bass; an instrument that is second lowest in pitch in its family

		Heteroclite: (a) abnormal or irregular; (n) an abnormal thing or person; an irregularly declined word, especially a Greek or Latin noun

		Vaticination: prediction; the act of prophesying

		Vaticinate: foretell the future

		Pasquinade: a satire or lampoon, originally one displayed or delivered in a public place

		Ad ignorantiam: argument from ignorance, or appeal to ignorance (in which ignorance represents "a lack of contrary evidence") is a fallacy in formal logic, where a proposition is deemed true or false because of lack of evidence to the contrary

		Epiphonema: an exclamatory sentence, especially a striking or summary comment concluding a discourse

		Erotesis: a manner of phrasing a question that presupposes an answer that is either a strong affirmative or, more often, a strong negative, and doesn't lead us to expect an answer

		Momus: in Greek mythology, the personnification of satire and mockery

		Dioptric: relating to the refraction of light, especially in the organs of sight or in devices which aid or improve the vision

		Operose: involving or displaying much industry or effort

		Glacis: a bank sloping down from a fort which exposes attackers to the defenders missiles; a sloping piece of armor plate protecting part of the vehicle

		Ravelin: an outwork of fortifications, with two faces forming a salient angle, constructed beyond the main ditch and in front of the curtain

		Logomachy: an argument about words

		Pyroballogy: the study of artillery

		Interlard: intersperse or embellish speech or writing with different material

		Lard: (n) fat from the abdomen of a pig that is rendered and clarified for use in cooking; (v) insert strips of fat or bacon in (meat) before cooking; smear or cover (a foodstuff) with lard or fat to prevent it drying out during storage; embellish (talk or writing) with an excessive number of esoteric or technical expressions; cover or fill thickly or excessively

		Scarp: (n) a very steep bank or slope. an escarpment; the inner wall of a ditch in a fortification; (v) cut or erode (a slope or hillside) so that it becomes steep, perpendicular, or precipitous; provide (a ditch in a fortification) with a steep scarp and counterscarp

		Counterscarp: the outer wall of a ditch in a fortification

		Epistasis: the interaction of genes that are not alleles, in particular the suppression of the effect of one such gene by another

		Aposiopesis: the device of suddenly breaking off in speech

		Transubstantiation: the conversion of the substance of the Eucharistic elements into the body and blood of Christ at consecration, only the appearances of bread and wine still remaining

		Subacid: (of a fruit) moderately sharp to the taste

		Prithee: (archaic, exclamation) please (used to convey a polite request) (ety: abbreviation of pray thee

		Animus: hostility or ill feeling; motivation to do something; (in Jungian philosophy)  the masculine part of a woman's personality

		Anima: (in Jungian philosophy) the feminine part of a man's personality; the part of the psyche which is directed inwards, in touch with the subconscious  (as opposed to persona)

		Persona: the aspect of someone's character that is presented to or perceived by others; a role or character adopted by an author or an actor

		Buccinator: a flat, thin muscle in the wall of the cheek

		Orbicular: having the shape of a flat ring or disc; having a spherical or rounded shape; (of a rock) containing spheroidal igneous inclusions

		Fuliginous: sooty. Dusky

		Opificer: artificer, workman, maker

		Phthisis: pulmonary turberculosis or a similar progressive wasting disease

		Oppugn: question the truth or validity of

		Ratiocination: the process of exact thinking. Reasoning; a reasoned train of thought

		Antinosarian: (Tristram Shandy) those who argue the physiological impossibility of the nose (in knight's story, satire of the reformation polemic)

		Protasis: the clause expressing the condition in a conditional sentence

		Epitasis: in classical drama, the main action of a play, building toward a climax and denouement. Third of five parts, following prelude and protasis and preceding catastasis and catastrophe

		Catastasis: the climax of a drama (see epitasis )

		Galligaskin: (Brit, historical) breeches, trousers, or gaitors

		Aposiopesis: the device of suddenly breaking off in speech

		Catachresis: the use of a word in an incorrect way, for example the use of mitigate for militate

		Intaglio: (n) a design incised or engraved into a material; a gem with an incised design;  a printing process in which the type or design is etched or engraved l, such as photogravure; (v) engrave or represent by an engraving

		Triticale: a hybrid cereal produced by crossing wheat and rye, grown as fodder crop

		Quoth: (archaic, humorous) said (used only in the first and third person singular before the subject)

		Tabes: emaciation (Ety: Latin for "wasting away")

		Tabid: pertaining to or affected with tabes

		Whilom: (archaic) (adv) formerly. In the past; (a) former. Erstwhile

		Radical moisture: (Grecian medicine) the nutritive, hormonal essence of the organism

		Vocable: a word, especially with reference to form rather than meaning

		Phalanx: a body of troops or police officers standing or moving in close formation; a group of people or things of a similar type forming a compact body; (in Ancient Greece) a body of Macedonian infantry drawn up in close order with shields touching and long spears overlapping; a bone of the fifer or toe

		Trowel: (n) a small handheld tool with a flat, painted blade, used to apply and spread mortar or plaster; a small handheld tool with a curved scoop for lifting plants or earth; (v) apply or spread with or as if with a trowel

		Hod: a builder's v-shaped open trough on a pole, used for carrying bricks and other building materials; a coal scuttle

		Mortar: (n) a short smooth-bore gun for firing shells (technically called bombs) at high angle; a device used for firing a lifeline or firework; a cup-shaped receptacle in which ingredients are crushed or ground. Used in cooking or pharmacy; a mixture of lime with cement, sand, and water, used in building to bond bricks or stones; (v) attach or bombard with a mortar; fix or join using mortar

		Supernal: relating to the sky or heavens; celestial; of exceptional quality or extent

		Ghazal: (in middle Eastern and Indian literature and music) a lyric poem with a fixed number of verses and a repeated rhyme, typically on the theme of love, and normally set to music

		Transmogrify: transform in a surprising or magical manner

		Fauntleroy: an excessively well-mannered or elaborately dressed young boy

		Operatic: relating to or characteristic of opera; extravagantly theatrical. Histrionic

		Wog: (informal, offensive) (Brit) a person who is not white; (Australian) a foreigner or immigrant, especially one from Southern Europe

		Dacoit: (in India or Burma) a member of a band of armed robbed

		Crorepati: a person who resides in a household whose net worth or wealth exceeds ten million rupees, or units of another currency (from the unit crore from the Indian numbering system which is equivalent to 10 million)

		Hapax legomenon: a term of which only one instance of use is recorded

		Henotheism: adherence to one particular God out of several, especially by a family, tribe, or other group

		Sempiternal: eternal and unchanging; everlasting

		Haft: (n) the handle of a knife, axe, or spear; shaft, shank, hilt, butt, stock, grip, helve; (v) provide (a blade, axe, or spearhead) with a haft

		Helve: the handle of a weapon or tool

		Puce: (a) of a dark red or purple-brown color; (n) a dark red or purple-brown color

		Obeah: a kind of sorcery practiced especially in the carribean

		Dybbuk: (in Jewish folklore) a malevolent wandering spirit that enters and possesses the body of a living person until exorcised

		Immanent: existing or operating within; inherent, intrinsic; (of god) permanently pervading and sustaining the universe

		Scrivener: a clerk, scribe, or notary; a person who invested money at interest for clients and lent funds to those who wanted to raise money on security

		Hortatory: tending or aiming to exhort
		
		Effluent: liquid waste or sewage discharged into a river or the sea

		Effluence: a substance that flows out from something; the action of flowing out

		Protracted: lasting for a long time or longer than expected or usual

		Protract: prolong

		Phylactery: a small leather box containing Hebrew texts on vellum, worn by Jewish men at morning prayer as a reminder to keep the law (tefilin)

		Beck: a gesture requesting attention, such as a nod or wave; (northern English) a stream

		Cachinnate: laugh loudly

		Congeal: become semi-solid, especially on cooling; coagulate, clot, cake, set, harden, gel, inspissate; take shape or coalesce, especially to form a satisfying whole

		Cake: (as v) (of a thick or sticky substance that hardens when dry) cover and become encrusted on (the surface of an object); (of a thick or sticky substance) dry or harden into a solid mass; congeal, clot, coagulate

		Momently: from moment to moment. Continually; at any moment; for a moment. Briefly

		Efface: erase (a mark) from a surface; cause (a memory or emotion) to disappear completely; make oneself appear insignificant or inconspicuous

		Tenant: (n) a person who occupies land or property rented from a landlord; a person in possession of real property by any right or title; (v) occupy (property) as a tenant

		Pretercanine: more than canine, not merely canine

		Festal: (archaic) relating to or characteristic of a celebration or festival

		Pervious: (of a substance) allowing water to pass through. Permeable

		Charnel: (a) associated with death; (n) a charnel house. A building or vault in which corpses or bones are piled; a place associated with violent death

		Floweret: a floret, especially of cauliflower or broccoli

		Floret: one of the small flowers making up a composite flower head; a small flower; one of the flowering stems making up a head of cauliflower or broccoli

		Manure: (n) animal dung used for fertilizing land; any compost or artificial fertilizer; (v) apply manure to (land)

		Spoony: (archaic) (a) sentimentally or foolishly amorous; foolish, silly; (n) a silly or foolish person

		Breaker: (sense 1) a heavy sea wave that breaks into white foam on the shore

		Grecian: relating to Ancient Greece, especially its architecture

		Trail: (n) a mark or a series of signs or objects left behind by the passage of someone or something; a track, scent, or other indication used in following someone or hunting an animal; spoor; a long thin part or line stretching behind or hanging down from something; a beaten path through the countryside; the rear end of a gun carriage, resting or sliding on the ground when the gun is unlimbered; (v) draw or be drawn along behind someone or something; drag, tow; (typically of a plant) grow or hand over the edge of something along the ground; creep, crawl; walk or move slowly or wearily; trudge, plod; (away) (of the voice or a speaker) fade gradually before stopping; ebb, subside, wane, dwindle; follow (a person or animal) by using marks or scent left behind; shadow, stalk, dog, hound, spoor, pursue; be losing to an opponent in a game or contest; give advance publicity to (a film, broadcast, or proposal); apply (slip) through a nozzle or spout to decorate ceramic ware

		Foil: (v) prevent (something considered wrong or undesirable) from succeeding; thwart, frustrate, counter, baulk, hamper, impede, obstruct, hinder, snooker, derail; frustrate the efforts or plans of (someone); (of a hunted animal) run over or cross (ground or a scent or track) in such a way as to confuse the hounds; (n) the track or scent of a hunted animal; (archaic) a setback in an enterprise. A defeat; metal hammered or rolled into a thin flexible sheet; a person or thing that contrasts with and so emphasizes and enhances the qualities of another; a thin leaf of metal placed under a precious stone to increase its brilliance; a leaf-shaped curve formed by the cusping of an arch or circle; a light, blunt-edged fencing sword with a button on its point; (short for hydrofoil) each of the structures fitted to a hydrofoil's hull to lift it clear of the water at speed

		Paynim: (archaic) a non-Christian, especially a Muslim

		Girandole: a branched support for candles or other lights, which either stands on a surface or projects from a wall

		Carol: (n) a religious folk song or popular hymn, particularly one associated with Christmas; (v) sing or say (something) happily; warble, chirp, chant, pipe, intone; the activity of singing Christmas carols

		Intone: say or recite something with little rise and fall of the pitch of the voice; intonate, recite, cantillate

		Cantillate: chant orbintone (a passage of religious text)

		Ruth: (archaic) a feeling of pity, distress, or grief

		Advert: refer to in speaking or writing

		Cynosure: a person or thing that is the centre of attention or admiration (ety: from Greek "kuōn + oura" meaning "dog's tale" originally denoting the constellation Ursa Minor or the pole star which it contains)

		Ignis fatuus: a will-o'-the-wisp (ety: Latin "foolish fire" because of its erratic movement)

		Allege: claim or assert that someone has done something illegal or wrong, typically without proof

		Intercession: the action of intervening on behalf of another; mediation, arbitration; the action of saying a prayer on behalf of another

		Embrute: to degrade or sink to the level of a brute

		Cumber: (dated) (v) hamper or hinder; obstruct (a path or space); (n) (archaic) a hindrance, obstruction, or burden

		Easel: a wooden frame for holding an artist's work while it is being painted or drawn

		Uptear: to tear up by or as if by the roots. Destroy

		Discriminate: (between) recognize a distinction. Differentiate; (from) perceive or constitute the difference in or between; (against) make an unjust or prejudicial distinction in the treatment of different categories of people, especially on the grounds of race, sex, or age

		Bombazine: a twilled dress fabric of worsted and silk or cotton, especially a black kind formerly used in mourning clothes

		Bracken: a tall fern with coarse lobed fronds, which occurs worldwide and can cover large areas; (informal) any large coarse fern resembling bracken

		Frond: the leaf or leaf-like part of a plan, fern, or similar plant

		Bent: (as n) a natural talent or inclination; predisposition, instinct, leaning, tendency, penchant, predilection, proclivity, propensity, talent, gift, flair, knack, aptitude; a stiff grass which is used for lawns and is a component of pasture and hay grasses; the stiff flowering stalk of a grass

		Carmine: a vivid crimson color; a vivid crimson pigment made from cochineal

		Cochineal: a scarlet due used for coloring food, made from the crushed dried bodies of a female scale insect; a dye similar to cochineal made from the oak kermes insect; the scale insect that is used for cochineal, native to Mexico and formerly cultivated on cacti

		Kermes: a red dye obtained from the crushed dried bodies of a female scale insect, used for coloring fabrics and manuscripts; the scale insect from which kermes is obtained, forming berry-like falls on the kermes oak

		Coadjutor: a bishop appointed to assist and often to succeed a diocesan bishop

		Hierophant: a person, especially a priest, who interprets sacred mysteries or esoteric principles

		Gable: the triangular upper part of a wall at the end of a ridged roof; (as gable end) a wall topped with a gable; a gable-shaped canopy over a window or door

		Phosphene: a sensation of a ring or spot of light produced by pressure on the eyeball or direct stimulation of the visual system other than by light

		Twaddle: (informal) (n) trivial or foolish speech or writing. Nonsense; (v) (archaic) talk or write in a trivial or foolish way

		Palanquin: (in India and the East) a covered litter for one passenger, consisting of a large box carried on two horizontal poles by four or six bearers

		Wag: (v) (especially with reference to an animal's tail) move or cause to move rapidly to and fro; move (an upwards pointing finger) fro side to side to signify disapproval; (n) a single rapid movement from side to side

		Toxophilite: (n) a student or lover of archery; (a) relating to archers and archery

		Calico: (n) (Brit) a type of cotton cloth, typically plain or unbleached; (NA) printed cotton fabric; (a) (NA) (of an animal, typically a cat) multicolored or piebald

		Banns: a notice read out on three successive Sundays in a parish church, announcing an intended marriage and giving

		Bruited: (v) spread (a report or rumor) widely; (n) a sound, especially an obnormal one, heard through a stethoscope. A murmur; (archaic) a report or rumor

		Gauge: (also gage) (n) an instrument that measures and gives a visual display of the amount, level, or contents of something; a tool for checking whether something conforms to a desired dimension; a means of estimating something; criterion, yardstick, basis, standard, guideline, touchstone; the thickness or capacity of something, especially as a standard measure, in particular: the diameter of a wire, tube, etc.; a measure of the diameter of a gun barrel, or of its ammunition, expressed as the number of spherical pieces of shot of the same diameter as the barrel than can be made from 1 lb; the thickness of sheet metal or plastic; the distance between the rails of a line of railway track; (v) estimate or determine the amount, level, or volume of; judge or assess (a situation, mood, etc); measure the dimensions of (an object) with a gauge; (as a) made in standard dimensions

		Hatchment: a large tablet, topically diamond-shaped, bearing the coat of arms of someone what has died, displayed in their honor

		Maraud: go about in search of things to steal or people to attack; raid and plunder (a place); harry, foray

		Deckle edge: the rough uncut edge of a sheet of paper, formed by a deckle

		Pettifogging: placing undue emphasis on petty details. Petty or trivial

		Pretermit: (archaic, oxytone) omit to do or mention; abandon (a custom or continuous action) for a time

		Millinery: women's hats; the trade or business of a milliner

		Milliner: a person who makes or sells women's hats

		Arcadia: a mountainous, landlocked region of Greece, known for the contented pastoral innocence of its people. Virgil said that it's isolation and bucolic character make it a perfect setting for pastoral poetry

		Bucolic: (a) relating to the pleasant aspects of the countryside and country life; a pastoral poem

		Edify: instruct or improve (someone) morally or intellectually

		Appropinquate: (obscure) to approach, to near

		Avocation: a hobby or minor occupation

		Vilipend: to despise; to express a disparaging opinion of; to treat or regard as if little value or account

		Brougham: a horse drawn carriage with a roof, four wheels, and an open driver's seat in front; a car with an open driver's seat

		Cairngorm: another term for smoky quartz (a semi-precious variety of quarts ranging in color from light greyish brown to nearly black

		Invalid: (n) a person made weak or disabled by illness or injury; (v) remove (someone) from active service in the armed forces because of injury or illness; disable (someone) by injury or illness

		Parthian: of, relating to, or characteristic of ancient Parthia or its people; relating to, being, or having the effect of a shot fired while in real or feigned retreat; (as Parthian shot) a parting shot

		Parting shot: a final remark, typically a cutting one, made by someone at the moment of departure

		Chit: a short official note, typically recording a sum owed; (Brit) an impudent or arrogant young woman

		Entresol: a low stores between the ground and the first floor of a building. A mezzanine floor

		Agios: the percentage charged on the exchange of one currency, or one form of money, into another that is more valuable

		Puisne: (pronounced puny) (in the UK and some other countries) denoting a judge of a superior count inferior in rank to chief justices

		Zenana: (in India or Iran) the part of a house for the seclusion of women

		Arras: a wall hanging made of rich tapestry fabric, typically used to conceal an alcove

		Arris: a sharp edge formed by the meeting of two flat or curved surface

		Alcove: a recess in the wall of a room or garden; niche, nook, hollow, cavity, apse, inglenook

		Inglenook: a space on either side of a large fireplace

		Ingle: (dialect) a domestic fire or fireplace; an inglenook

		Anchorite: a religious recluse

		Bloodletting: the surgical removal of some of the patient's blood for therapeutic purposes; the violent killing and wounding of people during war or conflict; bitter division and quarreling within an organization

		Hie: (archaic) go quickly

		Otiose: serving no practical purpose or result; (archaic) indolent or idle (ety: Latin "otium" meaning leisure)

		Transitory: not permanent; transient, ephemeral, évanescent, fugacious, passing

		Concentre: concentrate (something) in a small space or area; come together at a common centre; (archaic) bring (two or more things) towards a common centre

		Eventide: the end of the day. Evening

		Captious: tending to find faults or raise petty objections; pedantic, pettifogging, censorious, overcritical

		Vassalage: a position of subordination or submission the homage, fealty, or service due from a vassal

		Chancel: the part of a church near the altar, reserved for the clergy and choir, and typically separated from the nave by steps or a screen

		Convolvulus: a twining plant with trumpet-shaped flowers, of which some kinds are invasive weeds (see also bindweed) and others are cultivated for their bright flowers

		Bindweed: a twining plant with trumpet-shaped flowers, several kinds of which are invasive weeds; used in names of twining plants similar to bindweed

		Benignant: kindly and benevolent; a less common term for benign; (archaic) having a good effect; beneficial

		Phrenic: relating to the diaphragm (because the Greek thought the mind lied in the diaphragm)

		Spray: (n) liquid blown or driven through the air in the form of tiny drops; an act of spraying something; a stem or small branch of a tree or plant, bearing flowers and foliage; a bunch of cut flowers arranged in an attractive way; nosegay, posy, boutonnière, button hole, bouquet; a brooch in the form of a bouquet of flowers; (v) apply (liquid) to someone or something in the form of tiny drops; (of liquid) be driven through the air or forced out of something in tiny drops; scatter (something) somewhere with great force; fire a rapid succession of bullets at; (if a male cat) direct a stream of urine over (an object or area) to mark a territory; (in sport) kick, hit, or throw (the ball) in an unpredictable way

		Greengage: a sweet greenish fruit resembling a small plum; the tree bearing greengages

		Scallop: (n) an edible bivalve mollusk with a ribbed fan-shaped shell. Scallops swim by rapidly opening and closing the shell valves; a small pan or dish shaped like a scallop shell and used for baking or serving food; each of a series of convex rounded projections forming an ornamental edging cut in material or worked in lace or knitting in imitation of the edge of a scallop shell; another term for escalope; (v) ornament (an edge or material) with scallops; cut, shape, or arrange in the form of a scallop shell; bake with milk or a sauce

		Celandine: a common plant of the buttercup family which produces yellow flowers in the early spring

		Posy: a small bunch of flowers; posy, nosegay, bouquet, corsage; (archaic) a short motto or line of verse inscribed inside a ring

		Corsage: a spray of flowers worn pinned to a woman's clothes; the upper part of a woman's dress

		Protoplasm: the colorless material comprising the living part of a cell, including the cytoplasm, nucleus, and other organelles

		Autotelic: (of an activity or a creative work) having an end or purpose in itself

		Grave: (as v) (graved, graven) (archaic) engrave (an inscription or image) on a surface; (literary) fix (something) indelibly in the mind

		Lace: (n) a fine open fabric of cotton or silk, made by looping, twisting, or knitting thread in patterns and used especially for trimming garments; braid used for trimming, especially on military dress uniforms; shoelaces; (v) (up) fasten or tighten (a shoe or garment) by tying the laces; (up) tighten a laced corset around the waist of; fasten someone into (a garment) by tightening the laces; entwine (things, especially fingers) together; pass a lace or cord through (a hole); add an ingredient, especially alcohol, to (a drink or dish) to enhance its flavor or strength; give (something) a large amount or degree of a feature or quality

		Jenny: (short for spinning jenny) a machine for spinning with more than one spindle at a time, patented by James Hargreaves in 1770; a female donkey or ass

		Nullity: an act or thing that is legally void; the state of being legally void, especially with reference to a marriage; a thing of no importance or worth; nothingness

		Anneal: heat (metal or glass) and allow it to cool slowly, in order to remove internal stresses and toughen it

		Dibble: (n) a pointed hand tool for making holes in the ground for seeds or young plants; (v) make (a hole) in soil with a dibble; sow (a seed or plant) with a dibble

		Lenity: the quality of being kid or gentle

		Spirit: (as v) (away) convey rapidly and secretly

		Eleemosynary: relating to or dépendant in charity; charitable (ety: Greek "eleēmosunē" meaning compassion, and then Late Latin "eleemosyna" for alms)

		Touchstone: a piece of fine-grained dark schist or jasper formerly used for testing alloys of gold by observing the color of the mark which they made on it; s standard or criterion by which something is judged or recognized

		Schist: a coarse-grained metamorphic rock which consists of layers of different minerals and can be split into thin irregular plates

		Metamorphic: denoting or relating to rock that has undergone transformation by heat, pressure, or other natural agencies, e.g. in the folding of strata or the nearby intrusion of igneous rocks; of or marked by metamorphosis

		Viz.: (British) namely. In other words (used to introduce a gloss or explanation) (short for videlicet)

		Hereditament: (dated) any item of property, either a corporeal hereditament (land or a building) or an incorporeal hereditament (such as rent) that can be inherited; an item of inheritance

		Nowise: (archaic) in no way or manner

		Enthusiasm: intense and eager enjoyment, interest, or approval; something that arouses enthusiasm; (archaic, derogatory) religious fervor supposedly resulting directly from divine inspiration, typically involving speaking in tongues and wild, uncoordinated movements of the body (ety: Greek "enthous" meaning "possessed by a god, inspired")

		Covey: a small flock of birds, especially partridge; a small group of people or things

		Potation: (archaic, humorous) an alcoholic drink; the action of drinking alcohol; a drinking bout

		Boreas: the Greek god of the north wind; the north wind personified

		Eurus: the east or southeast wind personified

		Enamel: (n) an opaque or semi-transparent glossy substance that is a type of glass, applied by vitrification to metallic or other hard surfaces for ornament or as a protective coating; a work of art executed in enamel; the hard glossy substance that covers the crown of a tooth; a paint that dries to give a smooth, hard coat; (dated) nail varnish (v) coat or decorate (a metallic or hard object) with enamel; apply nail polish to (fingernails or toenails)

		Vermilion: a brilliant red pigment made from mercury sulphide (cinnabar); a brilliant red color

		Cinnabar: a bright red mineral consisting of mercury sulphide, sometimes used as a pigment; the bright red color of cinnabar; a day-flying moth with black and red wings, whose black and yellow caterpillars feed on groundsel and ragwort

		Ragwort: a yellow-flowered ragged-leaved European plant of the daisy family, which is a common weed of grazing land and is toxic to livestock

		Alabaster: (n) a translucent form of gypsum or calcite, typically white, often carved into ornaments; (a) made of alabaster; like alabaster in whiteness and smoothness

		Cambric: a lightweight, closely woven white linen or cotton fabric

		Pillion: a seat for a passenger behind a motorcyclist; (historical) a woman's light saddle; a cushion attached to the back of a saddle, in which a second person may ride

		Mittimus: a warrant committing a person to prison

		Rodomontade: (n) boastful or inflated talk or behavior; (v) (archaic) talk boastfully

		Preponderate: be greater in number, influence, or importance

		Trumpery: (archaic) (n) attractive articles of little value or use; gewgaw, gimcrack, bauble, trinkets; practices or beliefs that are superficially or visually appealing but have little real value or worth; (a) showy but worthless; delusive or shallow

		Muff: a tube made of fur or other warm material into which the hands are placed for warmth; a warm or protective covering for other parts or the body

		Reprobate: (n, a) an unprincipled person; rogue, rascal, scoundrel, villain, wretch, take, degenerate, knave, blackguard; (in Calvinism) a sinner who is. If of the elect and is predestined to damnation; (v) (archaic) express or fell disapproval for; censure, reprehend, condemn

		Fie: (archaic, humorous) used to express disgust or outrage

		Prolegomenon: a critical or discursive introduction to a book

		Luminary: a person who inspires or influences others, especially one prominent in a particular sphere; (archaic) a natural light-giving body. Especially the sun or moon; an artificial light

		Panjandrum: a person who has or claims to have great authority or influence

		Lucubration: (archaic) writing or study; a learned or pedantic piece of writing

		Ogle: (v,n) stare at in a lecherous manner

		Votary: a person, such as a monk or nun, who has made vows of dedication to religious service; a devoted follower, adherent, or advocate of someone or something

		Mouser: an animal that catches mice, especially a cat

		Choler: (in medieval science and medicine) one of the four bodily humors, identified with bike and believed to be associated with a peevish or irascible temperament; (archaic) anger or irascibility

		Contexture: the act, process, or manner of weaving parts into a whole; a structure so formed
		
		Fealty: (to) a feudal tenant's or vassal's sworn loyalty to a lord; (do fealty) formal acknowledgement of loyalty to a lord

		Madding: acting madly. Frenzied; maddening

		Lock: (n) a fastening mechanism; hasp, latch, bolt; (in wrestling or martial arts) a hold that prevents an opponent from moving a limb; a short section of a canal or river with gates and sluices at each end which can be opened or closed to change the water level, used for raising or lowering boats; (Brit) the turning of the front wheels of a vehicle to change its direction of motion; the maximum extent that the front wheels of a vehicle can be turned; a mechanism for exploding the charge of a gun; a piece of a person's hair that could or hangs together; tress, tuft, curl, ringlet, forelock, plait, hank, wisp, snippet; a person's hair; a tuft of wool or cotton; (v) fasten or secure (something) with a lock; go through a lock on a canal; make or become rigidly fixed or immovable; join, interlock, mesh, engage, yoke

		Tress: a long lock of a woman's hair

		Hank: a coil or skein of wool, hair, or other material; a measurement of the strength per unit mass of cloth or yarn, which varies according to the type being measured. For example it is equal to 840 yards for cotton and 560 for worsted; a ring for securing a staysail to the stay

		Staysail: a triangular fore-and-aft sail extended on a stay

		Stay: (sense 2) (v) stop, delay, or prevent (something), in particular suspend or postpone (judicial proceeding) or refrain from pressing charges; assuage (hunger) for a short time; curb. Check; (up) support or prop up; secure or steady (a mast) by means of stays; (n) a curb or check; a suspension or postponement of judicial proceeding; a device used as a brace or support; a corset made of two pieces laced together and stiffened by strips of whalebone; a large rope, wire, or rod used to support a ship's mast, leading from the masthead to another mast or spar or down to another part of the ship; a guy or rope supporting a flagstaff or other upright pole; a supporting wire or cable on an aircraft

		Scull: (n) each of a pair of small oars used by a single rower; an oar placed over the stern of a boat to propel it by a side to side motion, reversing the blade at each turn; a light narrow boat propelled with a scull or a pair of sculls; a race between boats in which each participant uses a pair of oars; (v) propel a boat with sculls; transport (someone) in a boat propelled with sculls; (of an aquatic animal) propel itself with fins or flippers

		Sculler: a person who sculls a boat; a boat propelled with a scull or pair of sculls

		Riparian: relating to or situated on the banks of a river; relating to wetlands adjacent to rivers and streams (ety: Latin "ripa" meaning "bank")

		Antimacassar: a piece of cloth put over the back of a chair to protect it from grease and dirt or as an ornament

		Spoke: each of the bars or wire rods connecting the centre of a wheel to its outer edge; each of a set of radial handles projecting from a ship's wheel; each of the metal rods in an umbrella to which the material is attached

		Hub: the central part of a wheel, rotating in or with the axle, and from which the spokes radiate; the effective center of an activity, region, or network

		Gimlet: a small T-shaped tool with a screw tip for boring holes

		Briar: any of a number of prickly scrambling shrubs, especially a wild rose; a tobacco pipe made from woody nodules borne at ground level by a large woody plant of the heather family; the tree heath which bears the nodules from which briar pipes are made

		Coracle: (esp. in wales and Ireland) a small round boat made of wickerwork covered with a watertight material, propelled with a paddle

		Clematis: a climbing plant of the buttercup family which bears white, pink, or purple flowers and feathery seeds. Several kinds are cultivated as ornamentals

		Punt: (n) a long, narrow flat-bottomed boat, square at both ends and propelled with a long pole, used on inland waters chiefly for recreation; (v) travel or convey in a punt

		Toddy: a drink made of spirits with hot water, sugar, and sometimes spices; the naturally alcoholic sap of some kinds of palm, used as beverage in tropical country

		Angler: a person who fishes with a rod and line; shirt for anglerfish

		Anglerfish: a fish that lures prey with a fleshy lobe on a filament arising from the snout, typically with a very large head and wide mouth, and a small body and tail

		Rimy: covered with frost

		Rime: (n) frost formed in cold objects by the rapid freezing of water vapor in cloud or fog; hoar frost; (v) cover (an object) with hoar frost

		Farinaceous: consisting of or containing starch

		Farina: flour or meal made from cereal grains, nuts, or starchy roots; (archaic) a powdery substance

		Gormandize: eat good food, especially to excess

		Disputatious: fond of having heated arguments

		Audacity: a willingness to take bold risks; daring, bravery, courage, valor, pluck, mettle; rude or disrespectful behavior. Impudence, cheek, nerve, gall, insolence

		Epergne: an ornamental centerpiece for a dining table, typically used for holding fruit or flowers

		Linchpin: a person or thing vital to an enterprise or organization; a pin passed through the end of an axle to keep a wheel in position

		Plait: (pronounced plat) (n) (Brit) a single length of hair, straw, rope, or other material made up of three or more interlaced strands; (v) form (hair, straw, rope, or other material) into a plait or plaits; make (something) by forming material into plait or plaits

		Patten: a shoe or clog with a raised sole or set on an iron ring, worn to raise one's feet above wet or muddy ground when walking outdoors

		Howbeit: (archaic) nevertheless; however

		Durst: archaic or regional past of dare

		Hulk: an old ship stripped of fittings and permanently moored, especially for use as storage or (formerly) as a prison; a large disused structure; a large or unwieldy boat or other object; a large, clumsy-looking person

		Rampage: (v) (esp. of a large group of people) move through a place in a violent and uncontrollable manner; (n) a period of violent and uncontrollable behavior by a group of people

		Ramp: (as v) (up) increase the level or amount of (something) sharply; (Brit) drive up the price of a (company's shares) in order to gain a financial advantage; (archaic) (of an animal) tear up on its hind legs in a threatening posture; (archaic) rush about uncontrollably; (archaic) (of a plant) grow or climb luxuriantly; provide with a ramp; (of an electrical waveform) increase or decrease voltage linearly with time

		Obtrude: become noticeable in an unwelcome or intrusive way; impose or force (something) in someone in an unwelcome or intrusive way

		Circumjacent: (archaic) surrounding

		Abscess: a swollen area within body tissue, containing an accumulation of pus; ulcer, cyst, boil, carbuncle, pustule, papule, whitlow, furuncle, canker

		Forelock: a lock of hair growing just above the forehead; theboart if the mane of a horse or similar animal, which grows from the poll and hangs down over the forehead

		Poll: (n) the process of voting in an election; the number of votes cast in an election; the places where votes are cast in an election; short for opinion poll; a person's head; thheboartbof the head on which hair grows. The scalp; a hornless animal, especially one of a breed of hornless cattle; (v) record the opinion or vote of; (of a candidate in an election) receive a specified number of votes; cut the horns of (an animal, esp. a young cow)

		Divers: of varying types. Several

		Ordnance: mounted guns. Artillery; (US) munitions; a branch of government service dealing especially with military stores and materials

		Lumpish: roughly or clumsily formed or shaped; (of a person) stupid and lethargic

		Practicable: able to be done or put into practice successfully; able to be used. Useful

		Absolve: declare (someone) free from guilt, obligation, or punishment; exonerate, acquit, vindicate, clear; (in church use) give absolution for (a sin)

		Adjunct: (n) a thing added to something else as a supplementary rather than an essential part; appendage, addendum, affix, additive, appurtenances; a person who is another's assistant or subordinate; a word or phrase that constitutes an optional element or is considered of secondary importance in a sentence, for example "on the table" in "we left some flowers on the table"; (in systemic grammar) an obligatory or optional adverbial functioning as a constituent of clause structure; (a) connected or added to something

		Ostler: a man employed to look after horses of people staying at an inn

		Portable property: (John Wemmick gets his rings from convicts on death row in Great Expectations) the belongings you can take with you and leave when things get rough and you have to go away in a hurry

		Conduce: help to bring about (a particular situation or outcome)

		Sconce: a candle holder that is attached to a wall with an ornamental bracket; a flaming torch or candle secured in a sconce

		Affianced: be engaged to marry

		Collier: (Brit) a coal miner; a ship carrying coal

		Bowsprit: a spar running out of a ship's bow, to which the forestays are fastened

		Apportion: divide up and share out; allocate, allot, dispense, ration; assign

		Bagatelle: a game in which small balls roll down a sloping board with numbered holes corresponding to scored achieved and obstructing pins; a thing regarded as too unimportant or easy to be worth much consideration; a short, light piece of music, especially one for the piano

		Indite: (archaic) write. Compose

		Indict: (NA) formally accuse of or charge with a crime; arraign for, cite

		Auricula: an alpine primula from which a wide range of flowering cultivars have been developed. It has leaves that supposedly resemble bears' ears

		Cultivar: a plant variety that has been produced in cultivation by selective breeding. Cultivars are usually designated in the style taxus baccata "variegata"

		Primula: a plant of a genus that includes primroses, cowslips, and polyanthuses. Many kinds are cultivated as ornamentals, bearing flowers in a wide variety of colors in the spring

		Saxifrage: a low-growing plant of poor soils, bearing small white, yellow, or red flowers and forming rosettes of succulent leaves or hummocks of mossy leaves. Many are grown as alpines in rockeries

		Rockery: a heaped arrangement of rough stones with soil between them, planted with rock plants, especially alpines

		Alpine: (a) relating to high mountains; relating to the Alps; relating to orndenoting skiing downhill; (n) a plant native to mountain districts, often suitable for growing in rock gardens; a North American butterfly which has brownish-black wings with orange-red markings

		Stile: an arrangement of steps that allows people but not animals to climb over a fence or wall; a vertical piece in the frame of a paneled door or sash window

		Sash: a long strip or loop of cloth worn over one shoulder or round the waist, especially as part of a uniform or official dress; a frame holding the glass in a window, typically one of two sliding frames in a sash window

		Sash window/ a window with one or two sashes which can be slid vertically to make an opening

		Caressive: ofnthe naturebof or resembling a caress; characterized by or given to caresses

		Miser: a person who harass wealth and spends as little money as possible; magpie, pinchpenny, niggard, Scrooge

		Magpie: a long-tailed crow with boldly marked (or green) plumage and a noisy call; used figuratively to refer to a person who obsessively collects things or who chatters idly; the division of a circular target next to the outer one, or a shot which strikes it

		Poltroon: an utter coward

		Thereabouts: (adv) near that place; used to indicate that a date or figure is approximate

		Hop: (v) (of a person) move by jumping on one foot; skip, jig, prance, caper, frolic, gambol; (of a bird or other animal) move by jumping with two or all feet at once; spring or leap a short distance with one jump; jump over (something); flavor with hops; (informal) (up) be stimulated or intoxicated by or as if by a narcotic drug; (n) a hopping movement; a short journey or distance; trip, jaunt, run; an informal dance; a twining climbing plant native to north temperate regions, cultivated for te flowers borne by the female plant, which are used in brewing beer; the dried cone-like flowers of the hop, used in brewing to give a bitter flavor and as a mild sterilant

		Sterilant: an agent used to destroy microorganismes. A disinfectant; a chemical agent used to destroy pests and diseases in the soil, especially fungi and nematodes

		Nematode: a worm of the large phylum Nematoda, such as the roundworm or threadworm

		Hob: (Brit) a cooking appliance, or the flat top part of a cooker, with hot plates or burners; a flat metal shelf at the side of a fireplace, having its surface level with the top of the grate and used especially for heating pans; a machine tool for cutting gears or screw threads; a male ferret

		Swim: (v) propel the body through water; cross (a particular stretch of water) by swimming; float on or at the surface of a liquid; cause to float or move across water; be immersed in or covered with liquid; appear to reel or whirl before one's eyes; experience a dizzily confusing sensation in one's head; (n) an act or period of swimming; a pool in a river which is a particularly good spot for fishing

		Corncrake: a secretive Eurasian crake inhabiting coarse grasslands, with mainly brown streaked plumage and a distinctive double rasping call. Due to changes in agricultural practices it is now much rarer in the British isles

		Crake: a bird of the rail family with a short bill, such as the corncrake; the rasping cry of the corncrake

		Chock: (n) a wedge or block placed against a wheel or rounded object, to prevent it from moving; a support for a rounded structure, such as a cask or the hull of a boat; a ring with a gap at the top, through which a rope or line is run; (v) prevent the movement of (a wheel or vehicle) with a chock; support (a boat, cask, etc.) on chocks
		
		Borborygmus: a rumbling or gurgling noise made by the movement of fluid and gas in the intestine

		Interpolate: insert (something of a different nature) into something else; insert (words) in a book or other text, especially in order to give a false impression as to its date; alter or enlarge (a text) by insertion of new material; insert (an intermediate value or term) into a series by estimating or calculating it from surrounding known values; interject (a remark) in a conversation

		Interpellate: (in a parliament) interrupt the order of the day by demanding an explanation from (the minister concerned); (of an ideology or discourse) bring into being or give identity to (an individual or category)

		In medias res: into the middle of a narrative; without preamble; into the midst of things

		Jaunt: (n) a short excursion or journey made for pleasure; (v) go on a short journey for pleasure

		Coif: (n) a woman'a close fitting cap, now only worn under a veil by nuns; a metal skullcap worn under armor; (v) style or arrange (someone's hair)

		Tread: (v) walk in a specified way; walk on or along; (into) press down or crush with the feet; trample, flatten, squash; (Brit) set one's foot on top off; (n) a person's manner of walking or the sound made as they walk; the top surface of a step or stair; the thick moulded part of a vehicle tyre that grips the road; the part of a wheel that touches the ground or a rail; the upper surface of a railway track, in contact with the wheels; theboart if the sole of a shoe that rests in the ground

		Prefatory: serving as an introduction; introductory, preliminary, precursory, prelusive, prodromal, antecedent, exordial, preambulatory, precursive, opening

		Prodromal: relating to or denoting the period between the appearance of initial symptoms and the full development of a rash or fever

		Swank: (Brit, informal) (v) display one's wealth, knowledge, or achievements in a way that is intended to impress others; (n) behavior, talk, or display intended to impress others; (a) (NA) swanky

		Swanky: (informal) stylishly luxurious and expansive; using one'a wealth, knowledge, or achievements to try to impress others

		Bantam: a chicken of a small breed, the cock of which is noted for its aggression, short for bantamweight

		Bantamweight: a weight in boxing and other sports intermediate between flyweight and featherweight. In the amateur boxing scale, it ranges from 51 to 54 kg; a bantamweight boxer or other competitor

		Welterweight: a weight in boxing and other sports intermediate between lightweight and middleweight. In the amateur boxing scale, it ranges from 63.5 to 67kg; a welterweight boxer or other competitor

		Margrave: the hereditary title of some princes of the Holy Roman Empire

		Guy: (n) a figure representing guy fawkes, burnt in a bonfire on Guy Fawkes night, and often displayed by children neighing for money for fireworks; (v) make fun of. Ridicule

		Papilla: a small rounded protuberance on a part or organ of the body; a small fleshy projection on a plant (ety: Latin meaning "nipple" diminutive of "papula" meaning "small protuberance")

		Cackle: (v,n) (of a bird, especially a hen or goose) give a raucous clucking cry; squawk, cluck, clack; laugh in a loud, harsh way; (informal) (on about) talk at length without acting on what is said

		Squawk: (v,n) (of a bird) make a loud, harsh noise; screech, squeal, croak, caw, cluck, clack, cackle, hoot; (of a person) say something in a loud, discordant tone; complain or protest about something; grouse, grouch, carp

		Clack: (v,n) make a sharp sound or series of sounds as a result of a hard object striking another

		Grouse: (n) a medium to large game bird with a plump body and feathered legs, the male being larger and more brightly colored than the female; the flesh of the grouse as food; a complaint or grumble; (v) complain about something trivial; grumble, cavil, carp, bleat, whine, make a fuss

		Castor: each of a set of small swiveling wheels fixed to the legs or base of a heavy piece of furniture so that it can be moved easily: a small container with holes in the top, especially one used for sprinkling sugar or pepper

		Homiletic: (a) of the nature of or characteristic of a homily; (n) he art of preaching or writing sermons

		Nolens volens: whether a person wants or likes something or not

		Thanatopsis: meditation on or contemplation of death (ety: pine of the earliest poems written by 19th c. American poet William Cullen, Bryant, an elegy that attempts to console humans given that everyone eventually must die)

		Ephod: (in ancient Israel) a sleeveless garment worn by Jewish priests

		Liege: (a) concerned with or relating to the relationship between a feudal superior and a vassal; (n) a feudal superior or sovereign; suzerain, seigneur; a vassal or subject

		Chancre: a painless ulcer, particularly one that develops on the genitals in venereal disease

		Gewgaw: a showy thing, especially one that is useless or worthless

		Epithalamium: a song or poem celebrating a marriage

		Shag: a carpet or rug with a long, rough pile; (of a pile) long and rough; cloth with a velvet nap on one side; a think tangled hairstyle or mass of hair; a coarse kind of cut tobacco; a Western European and Mediterranean cormorant with greenish-black plumage and a long curly crest in the breeding season; a dance originating in the US in the 30s and 49s characterized by a vigorous hopping from one foot to the other

		Pile: (n) the soft projecting surface of a carpet or a fabric such as velvet or flannel, consisting of many small threads; a heavy stake or post driven vertically into he bed of a river, soft ground, etc., to support the foundations of a superstructure; pillar, column, plinth, piling, stanchion, abutment, cutwater, upright; a heap of things laid or lying on top of one another; a large imposing building or group of buildings; a series of plates of dissimilar metals laid one on another alternately to produce an electric current; (v) strengthen of support (a structure) with piles; place (things) one on top of the other; (of a group of people) get into or out of (a vehicle) in a disorganized manner; (of a vehicle) crash into

		Cutwater: the forward edge of a ship's prow; a wedge-shaoedbprojection on the pier of a bridge, which divides the flow of water and prevents debris from becoming trapped against the pier

		Abutment: a structure built to support the lateral pressure of an arch or span, e.g. at the ends of a bridge; the process of supporting something with an abutment; a point at which something abuts against something else

		Abut: (of a building or an area of land) be next to or have a common boundary with; touch or lean on

		Picaresque: relating to an episodic type of fiction dealing with the adventures of a rough and dishonest but appealing hero

		Thresh: separate grain from (corn or other crops), typically with a flail or by the action of a revolving mechanism; move violently; thrash

		Clotheshorse: a frame on which washed clothes are hung to air indoors; (informal, derogatory) a person who is excessively concerned with wearing fashionable clothes

		Swale: (NA, dialect) a low or hollow place; especially a marshy depression between ridges

		Quiff: (Brit) a piece of hair brushed upwards and backwards from a man's forehead

		Bayou: (in the southern US) a marshy outlet of a lake or river

		Coupling: a device for connecting parts of machinery; a fitting on the end of a railway vehicle for connecting it to another; the action of mating or having sexual intercourse

		Euglena: a green single-celles freshwater organism with a flagellum, sometimes forming a green Axum on stagnât water

		Kiln: a furnace or oven for burning, baking, or drying, especially one for calcimine line or firing pottery

		Travertine: white or light-colored calcareous rock deposited from mineral springs, used in building

		Burdock: a large herbaceous old world plant of the daisy family, the hook bearing flowers become woody burrs after fertilization and cling to animals' coats to aid seed dispersal

		Burr: a whirring sound, such as a telephone ringing tone or the sound of cogs turning; a rough pronunciation of the letter r, especially with a uvular trill as in a northumberland accent; (loosely) a regional accent; a rough edge or ridge left in an object (esp. of metal) by the action of a tool or machine; a small rotary cutting tool with a shaped end, used chiefly in woodworking and dentistry; a small surgical drill for making holes in bone, especially in the skull; a siliceous rock used for millstones; a whetstone; a prickly seed case or flower head that clings to clothing and animal fur; a plant that produces burrs, such as the bur-reed; denoting wood containing knots and other growths which show a pattern of dense swirls in the grain when sawn, used for veneers and other decorative woodwork; the coroner of a deer's antler; (v) make a whirring sound, sleek with a regional accent, especially one in which the letter r is prominent; form a rough edge on (metal)

		Saw: (as v) (sawed, sawn) cut (something) using a saw; make or form (something) using a saw; (off) cut (something) as with a saw, especially roughly or so as to leave rough or unfinished edges; (away) make rapid sawlike motions in cutting or in playing a string instrument

		Coronet: a small or relatively simple crown, esp. worn by a lesser royalty and peers or peeresses; diadem, tiara, circlet, chaplet, wreath, coronal, garland, a circular decoration for the head, especially one made of flowers; a ring of bone at the base of a deer's antler; the band of tissue in the lowest part of a horse's pastern, containing the horn-producing cells from which the hoof grows

		Coronal: (n) a garland or wreath for the head; a small crown, a coronet; a coronal consonant; (a) relating to the corona of the sun or another star; relating to the crown of the head; of or in the coronal plane; (of a consonant) formed by raising the tip or blade of the tongue towards the hard palate

		Corona: the rarefied gaseous envelope of the sun and other stars. The sun's corona is normally visible only during a total solar eclipse, when in is seen as an irregularly shaped pearly glow surrounded the darkened disc of the moon; the glow around a conductor at high potential; a small circle of light seen round the sun or moon due to diffraction by water droplets; a crown or crown-like structure; the cup-shaped or trumpet-shaped outgrowth at the center of a daffodil or narcissus flower; a circular chandelier in a church; a part of a cornice having a broad vertical face

		Rarefied: (of air, esp. that at high altitude) of lower pressure than usual, thin; distant from the lives and concerns or ordinary people; esoteric

		Rarefy: make of become less dense or solid

		Rarefaction: reduction in the density of something, especially air or a gas; the lessening of density of tissue, especially of nervous tissue or bone

		Ciliary: relating to or involving cilia; relating to the eyelashes or eyelids; relating to the ciliary body of the eye

		Cilium: a short microscopic hair-like vibrating structure found in large numbers on the surface of certain cells, either causing currents in the surrounding fluid, or, in some protozoans and other small organisms, providing propulsion; an eyelash

		Medulla: the inner region of an organ or tissue, esp. when it is distinct from the outer region or cortex (as in a kidney, an adrenal gland, or hair); short for medulla oblongata; the soft internal tussue or pith of a plant (ety: Latin meaning pith or marrow)

		Medulla oblongata: the continuation of the spinal cord within the skull, forming the lowest part of the brain stem and containing control centres for the heart and lungs

		Cortex: the outer layer or the cerebrum (cerebral cortex) composed of folded grey matter and playing an important role in consciousness; an outer layer of another organ or body part such as a kidney (the renal cortex) the cerebellum, or a hair; an outer layer of tissue immediately below the epidermis of a stem or root

		Schismatic: (a) characterized by or favoring schism; separatist, heterodox, dissident, splinter; (n) (especially in the Christian church) a person who promotes schism. An adherent of a schismatic group

		Tarantella: a rapid whirling dance originating in southern Italy; a piece of music written in fast 6/8 time in the style of the tarantella

		Squamous: covered with orncharacterized by scales; relating to, consisting of, or denoting a layer of epithelium that consists of very thin flattened cells; denoting the flat portion of the temporal bone which forms part of the side of the skull

		Persimmon: an edible fruit that resembles a large tomato and has very sweet flesh, a tree which yields the persimmon, relating to ebony

		Diagrammatic: of or in the form of a diagram; schematic

		Bougainvillea: an ornamental shrubby climbing plant that is widely cultivated in the tropics. The insignificant flowers are surrounded by large, brightly colored papery bracts which persist on the plant for a long time

		Bract: a modified leaf or scale, typically small, with a flower or flower cluster in its axil. Bracts are sometimes larger and more brightly colored than the true flower, as in poinsettia

		Axil: the upper angle between a leaf stalk or branch and the stem or trunk from which it is growing

		Raglan: (a) having or denoting sleeves that continue in one piece up to the neck of a garment, without a shoulder seam; (n) an overcoat with raglan sleeves

		Gazette: (n) a journal or newspaper, especiallybthe official one of an organization or institution; (Brit) (v) announce or publish (something) in an official gazette; (to) publish the appointment of (someone) to a military or other official post

		Helicon: a large spiral bass tuna played encircling the player's head and resting on the shoulder

		Rambunctious: (NA, informal) uncontrollable exuberant. Boisterous

		Endive: (Brit) an edible Mediterranean plant, the bitter leaves of which may be used in salads; (NA) a chicory plant

		Chicory: a blue-flowered Mediterranean plant of the daisy family, cultivated for its edible salad leaves and carrot shaped root; the root of the chicory plant, which is roasted and ground for use as an additive or substitute for coffee; NA term for endive

		Panhandle: (n) a narrow strip of territory projecting from the main territory of one state into another; (informal) (v) beg in the street; beg for something from (someone) in the street

		Acedia: another term for accidie

		Accidie: spiritual or mental sloth; apathy

		Gyp: (informal) cheat or swindle someone

		Ankylosis: abnormal suffering and immobility of a joint due to fusion of the bone

		Kinetoscope: an early motion picture in which the in which the images were viewed through a peephole

		Infrangible: unbreakable. Inviolable

		Frangible: able to be broken into fragments; brittle or fragile; denoting ammunition designed to disintegrate into very small particles on impact

		Pepsin: the chief digestive enzyme of the stomach, which breaks down proteins into polypeptides

		Corolla: the petals of a flower, typically forming a whirl within the sepals and enclosing the reproductive organs

		Sepal: each of the parts of the calyx of a flower, enclosing the petals and typically green and leaf-like

		Calyx: the sepals of a flower, typically forming a whirl that encloses the the petals and forms a protective layer around a flower in bud; a cup-like cavity or structure, in particular: a portion of the pelvis of a mammalian kidney; the cavity in a calcareous coral skeleton that surrounds the polyp; the plated body of a crinoid, excluding the stall and arms

		Calcareous: containing calcium carbonate. Chalky; (of vegetation) occurring in chalk or limestone

		Crinoid: (n) an echinoderm of the class crinoidea, which comprises the sea lilies and feather stars; (a) relating to or denoting crinoids

		Echinoderm: a marine invertebrate of the phylum Echinodermata, such as a starfish, sea urchin, or sea cucumber

		Amphitryon: the husband of the virtuous Alcmene, whom Zeus seduced by assuming the form of Amphitryon, resulting in the birth of hercules; (french) a host. A person paying for dinner

		Amphipathic: (of a molecule, especially a protein) having both hydrophilic and hydrophobic parts (ety: Greek "pathos" meaning "experience")

		Amphi-: (combining form) both (amphibian); of both kinds (amphipod); on both sides (amphiprostyle); around (amphitheater)

		Stercoraceous: consisting of or resembling dung or faeces

		Onanism: masturbation; coitus interruptus

		Concoction: a mixture of various ingredients or elements; an elaborate story, especially a fabricated one; an elaborate or showy garment or hat

		Decoction: a concentrated liquor resulting from heating or boiling substance, especially a medicinal preparation made from plant; the action or process of extracting the essence of something

		Wuthering: (of weather) characterized by strong winds

		Penetralium: (plu penetralia) the innermost (most secret) part of a building; an inner sanctum

		Actuate: make (a machine or device) operate; make (someone) act in a particular way. Motivate; stimulate; rouse, prompt, invite, impel, goad

		Signet: a small seal, especially one set in a ring, used instead of or with a signature to give authentication to an official document; the royal seal formerly used for speacial purposes in England and Scotland, and in Scotland later as the seal of the court of session

		Pinafore: a collarless sleeveless dress worn over a blouse or jumper; a woman's loose sleeveless garment, typically full length and worn over clothes to keep them clean; a sleeveless apron-like garment worn over a young girl's dress, typically having ties or buttons at the back

		Asseverate: declare or state something in a solemn or emphatic manner

		Grimalkin: (archaic) a cat; a spiteful old woman

		Weathercock: (n) a weathervane in the form of a cockerel; (v) (of a boat or aircraft) tend to turn to head into the wind

		Weathervane: a revolving pointer to show the direction of the wind, typically mounted on top of a building

		Sough: (pronounced with silent gh) (v,n) (of the wind in trees, the sea, etc.) make a moaning, whistling, or rushing sound

		Exult: show or fell triumphant elation or jubilation; rejoice, jubilate, delight in, relish, luxuriate in, wallow in, bask in, glory in, revel

		Luxuriate: enjoy (something) as a luxury; take self-indulgent delight in; revel, bask, wallow

		Commination: the action of threatening divine vengeance; the recital of divine threats against sinners in the Anglican liturgy for Ash Wednesday; the church service that includes the commination

		Emulous: seeking to emulate someone or something; motivated by a spirit of rivalry

		Hasp: (n) a slotted hinged metal plate forming part of a fastening for a door or lid, fitted over a loop and secured by a pin or padlock; a slotted hinged plate on a trunk or suitcase with a projecting piece which is secured by the lock; (v, archaic) lock (a door, window, or lid) by securing the gasp over the loop of the fastening

		Scansion: the action of scanning a line of verse to determine its rhythm; the rhythm of a line of verse

		Chrysostom: Saint John, a prelate whose eloquent sermons earned him the name Chrysostom, "golden-mouth." His oratory against corruption eventually led to his death

		Ferrule: a ring or cap, typically a metal one, which strengthens the end of a handle, stick, or tube and prevents it from splitting or wearing; a metal band strengthening or forming a joint

		Consubstantial: of the same substance or essence (used especially of the three persons of the trinity in Christian theology

		Lintel: a horizontal support of timber, stone, concrete, or steel across the top of a door or window

		Piebald: (a,n) (of a horse) having irregular patches of two colors, typically black and white

		Skewbald: (a,n) (of an animal) having irregular patches of white and another color (properly not black)

		Pied: having two or more different colors

		Brindle: (n,a) a brownish or tawny color of animal fur, with streaks of other color; an animal with a brindle coat

		Jaspé: randomly mottled or variegated, like jasper

		Periwinkle: an old world plant with flat five-oetalled, typically bluish flowers and glossy leaves. Some kinds are grown as ornamentals and some contain alkaloids used in medicine; a purple-blue color like that of a periwinkle flower

		Archons: each of the nine chief magistrates in ancient Athens

		Scortatory: pertaining to lewness, prostitutes, or fornication (ety: Latin "scortari" meaning "associate with prostitutes")

		Nobodaddy: Blake's derisive and for te anthropomorphic God of Christianity

		Equipage: (archaic) the equipment for a particular purpose; (historical) a carriage and horses with attendants

		Descant: (n) an independent treble melody sung it played above a basic melody; (archaic, literary) a melodious song; a discourse on a theme; (v) talk tediously or at length

		Pelurious: hairy (coined by Joyce)

		Kine: (archaic) cows collectively

		Declivity: a downward slope

		Begob: (Irish) expressing amazement or emphasis

		Acuminate: (a) (of a plant or animal structure, e.g. a leaf) tapering to a point

		Skeeze: (slang) a sleazy or sexually promiscuous person

		Wampum: small cylindrical beads made by North American Indians from shells, strung together and worn as decoration or used as money

		Drouth: (dialect, literary) drought

		Cynanthropy: a form of madness involving the delusion of being a dog, with correspondingly altered behavior

		Garth: (Brit) an open space surrounded by cloisters; (archaic) a yard or garden

		Nasturtium: a South American trailing plant with round leaves and bright orange, yellow, or red flowers, which is widely grown as an ornamental

		Jorum: a large bowl or hug used for serving drinks such as tea or punch

		Emunctory: an organ (as a kidney) or part of the body (as the skin) that carries off body waste

		Mayhap: (archaic) perhaps, possibly

		Fluxion: a function corresponding to the rate of change of a variable quantity. A derivative (mathematics)

		Cockalorum: (dated) a self-important person

		Omnipollent: Joyce's word for omnipotent (from Latin omnipollens)

		Luculent: (of writing or speech) clearly expressed; brightly shining

		Lutulent: dirty, impure

		Verecund: shy or modest

		Sejunct: (a) (rare) separate, separated

		Thane: (in Anglo-saxon England) a man who held land granted by he kind or by a military nobleman, ranking between an ordinary freeman and a hereditary noble

		Fordo: (archaic) kill, destroy

		Misericord: a ledge projecting from the underside of a hinged seat in a choir stall which, when the seat is tuned up, gives support to someone standing; an apartment in a monastery in which some relaxations of the monastic rule were permitted; a small dagger used to delivering a death strike to a wounded enemy (ety: Latin "misereri+cor" meaning "to pity+heart")

		Sublunar: within the moon's orbit and subject to its influence

		Kalos kagathos: phrase used by classical Hrek writers to describe an ideal or gentlemanly conduct, especially in a military context

		Kalipedia: Joycean neologism meaning education through beauty

		Farraginous: consisting of a farrago

		Farrago: a confused mixture

		Entelechy: the realization of potential; the supposed vital principle that guides the development and functioning of an organism or other system or organization; the soul

		Kismet: destiny. Fate

		Teratology: a group of four related literary or operatic works; a series of four ancient Hreek dramas, three tragic and one comedy featuring a chorus of satyrs, originally presented together

		Aconite: a poisonous plant of the buttercup family, bearing hooded pink or purple flowers and found in temperate regions of the northern hemisphere; an extract of aconite, used as a poison or in pharmacy; a small herbaceous Eurasian plant, cultivated for its yellow flowers in early spring

		Prognathous: having a projecting lower jaw or chin; (of a lower jaw or chin) projecting

		Pudency: modesty or embarrassment

		Aphid: a small bug which feeds by sucking sap from plants; a black fly or greenfly. Aphids reproduce rapidly, sometime producing live young without mating, as large numbers can cause extensive damage to plants

		Saurian: (a) of or like a lizard; (n) any large reptile, especially a dinosaur or other extinct form

		Sauria: another word for Lacertilia

		Lacertilia: a group of reptiles that comprises the lizards

		Exeunt: used as stage direction j a playbto indicate that a group of actors leave the stage

		Hamadryad: a nymph who lives in a tree and died when the tree dies; another term for king cobra

		Terpsichorean: (formal, humorous) (a) relating to dancing; (n) a dancer (ety: Ancient Greek meaning "delight in dancing," one of the nine muses and goddess of dance and chorus

		Farrier: a smith who shoes horses

		Dander: flakes of skin in an animal's fur or hair; (informal) lose one's temper

		Aperient: (a,n) (chiefly of a drug) used to relieve constipation

		Vestige: a trace or remnant of something that is disappearing or no longer exists; relic, echo, remnant; the smallest amount; a part or organ of an organism which has become reduced or functionless in the course of evolution

		Appellative: (a) relating to or denoting the giving of a name; (n) a common noun, such as doctor, mother, sir, used as a vocative

		Obtund: (dated) dull the sensitivity of; blunt, deaden

		Inanition: exhaustion caused by lack of nourishment; lack of mental or spiritual vigor and enthusiasm

		Matutinal: of or occurring in the morning

		Neap: (n) (also neaptide) a tide just after the first or third quarters of then moon when there is least difference between high and low water; (v) (of a boat) be kept aground or in a harbor by a neaptide; (archaic) (of a tide) tend toward or reach the highest point of a neap tide

		Artesian: relating to or denoting a well bored perpendicularly into water-bearing strata lying at an angle so that natural pressure produces a constant supply of water with little or no pumping

		Rhabdomancy: dowsing with a rod or stick

		Dowsing: a technique for searching for underground water, minerals, ley lines, or anything invisible, by observing the motion of a pointer (traditionally a forked stick, now often paired bent wires) or the changes in direction of a pendulum, supposedly in response to unseen influences

		Dowse: practice dowsing; search for or discover by dowsing

		Hygroscopic: (of a substance) tending to absorb moisture from the air; relating to humidity or its measurements

		Lacustrine: relating to or associated with lakes

		Polyhedron: a solid figure with many plane faces, typically more than six

		Falciform: curved like a sickle. Hooked

		Diacritic: (n,a) a sign, such as an accent or cedilla, which when written above or below a letter indicates a difference in pronunciation from the same letter when unmarked or differently marked

		Quinquepartite: divided into or composed of five parts; maintained by or involving five participants or groups of participants

		Oviparous: (of an animal) producing young by means of eggs which are hatched after they have been laid by the parent, as in birds

		Viviparous: (of an animal) bringing forth live young which have developed inside the body of the parent; (of a plant) reproducing from buds which form plantlets which are still attached to the parent plant, or from seeds which germinate within the fruit

		Perigee: the point in the orbit of the moon or a satellite at which it is nearest to the earth

		Lunation: another term for lunar month, a month measured between successive new moons (roughly 29 1/2 days); (in general use) a period of four weeks

		Propinquity: the state of being close to someone or something. Proximity; close kinship

		Irruent: (Joyce) rushing, moving quickly, especially inwards

		Latria: (in the Roman Catholic Church) supreme worship allowed to God alone

		Hyperdulia: veneration of the Virgin Mary as the holiest of creatures (compare with latria)

		Nomothetic: relating to the study or discovery of general scientific laws

		Boustrophedon: (of written words) from right to left and from left to right in alternate lines (ety: Greek "bous + strophos" meaning "ox + turning" literally "as an ox turns in ploughing", it was a common way of writing in stone in Ancient Greece)

		Helot: a member of a class of serfs in ancient Sparta, intermediate in status between slaves and citizens; a serf or slave

		Adipose: (especially of body tissue) used for the storage of fat

		Velation: the act or process of veiling or the state of being veiled; the formation of velum

		Peccaminous: (Joyce) sinful (ety: Latin "pecco" meaning sin)

		Hock: (n) the joint in a quadruped's hind leg between the knee and fetlock, the angle of which points backwards; a knuckle of meat, esp. pork or ham; (v) (informal) deposit (an object) with a pawnbroker as security for lent money

		Fetlock: the joint of a horse's or other quadruped's leg between the cannon bone and the pastern

		Pastern: the sloping part of a horse's foot between the fetlock and the hoof; a corresponding part in some other domestic animal

		Lisle: a fine. Smooth cotton thread used especially for stockings

		Gizzard: a muscular, thick-walked part of a bird's stomach for grinding food, typically with grit; a muscular stomach of some fish, insects, molluscs and other invertebrates; (informal) a person's stomach or throat

		Palatal: (a) relating to the palate; (of a speech sound) made by placing the blade of the tongue against or near the hard palate (e.g. in yes); (n) a palatal sound

		Catty: deliberately hurtful in one's remarks. Spiteful; relating to cats. Catlike

		Lummox: (NA) (informal) a clumsy, stupid person

		Animadversion: criticism or censure; a comment or remark, especially a critical one

		Bleb: a small blister in the skin; a small bubble in glass or in a fluid; a rounded outgrowth on the surface of a cell

		Code duello: a set of rules for a one-to-one combat, or duel

		Steerage: the part of a ship providing the cheapest accommodation for passengers; (archaic) the action of steering a boa

		Doily: a small ornamental may made of lace or paper with a lace pattern, put on a plate under cakes or other sweet food

		Confab: (informal) (v,n) an informal private conversation

		Lapel: the part of on each side of a coat or jacket immediately below the collar which is folded back in either side of the front opening

		Skiff: a light rowing boat or sculling boat, typically for one person; (NA, Scottish) a flurry or light covering of snow
		
		Dowel: (n) a projecting peg used for holding together components of a structure; (v) fasten with a dowel or dowels

		Leonine: (a) of or resembling a lion or lions; relating to any of the popes named Leo, in particular denoting the part of Rome fortified by Leo IV (in 855); (of Medieval Latin verse) in hexameter or elegiac metre with internal rhyme; (of English verse) with internal rhyme; (n) Leonine verse

		Satyromania: (also satyriasis) uncontrollable or excessive sexual desire in a man

		Troposphere: the lowest region of the atmosphere, extending from the earth's surface to a height of about 6-10 km (the lower boundary of the atmosphere)

		Donnée: a subject or theme of a narrative; a basic fact or assumption

		Slipstream: (n) a current of air or water driven back by a revolving propeller or jet engine; the partial vacuum created in the wake of a moving vehicle, often used by other vehicles in a race to assist in overtaking; an assisting force regarded as drawing something along behind something else; (v) (especially in motor racing) follow closely behind another vehicle, traveling in its slipstream and awaiting an opportunity to overtake

		Proscenium: the part of a theatre stage in front of the curtain; the stage of an ancient theater; short for proscenium arch (an arch framing the opening between the stage and the auditorium in some theatres)

		Optimum: (a) most conducive to a favorable outcome; best; (n) the most favorable situation or level for growth, reproduction, or success

		Gravid: carrying eggs or young. Pregnant; (with) full of meaning or a specified quality

		Supererogation: the performance of more work (or money) than duty requires

		Blancmange: (Brit) a sweet opaque gelatinous dessert made with flavored cornflour and milk

		Dismay: (n) concern or distress caused by something unexpected; cause (someone) to feel concern and distress; appal, horrify, disconcert, confound, unnerve, unman, perturb, unsettle, discountenance

		Unman: deprive of qualities traditionally associated with men, such as self control or courage

		Divot: a piece of turf cut out of the ground by a golf club in making a stroke or by a sports player's boot; a small hole made by the removal of a divot; (scottish) a piece of turf, as formerly used for roofing cottages

		Dolman: a long Turkish robe open in front; a woman's loose cloak with cape-like sleeves

		Osprey: a large fish-eating bird of prey with long, narrow wings and a white underside and crown, found throughout the world

		Errancy: the state of erring or an instance of it

		Divagate: stray or digress

		Lour: (v) look angry or sullen. Scowl; glower, grimace, look daggers; (of the sky or landscape) look dark and threatening; overcast, leaden, gloomy, menacing; (n) a scowl; a dark and gloomy appearance of the sky or landscape

		Oche: (Brit) the line behind which darts players stand when throwing

		Infatuate: be inspired with an intense but short-lived passion or admiration for; besotted

		Yashmak: a veil concealing all of the face except the eyes, worn by some Muslim women in public

		Contradistinction: (in contradistinction to) distinction made by contrasting the different qualities of two things

		Entrain: (v) board a train; (of a current or fluid) incorporate and sweep along in its flow; cause or bring about as a consequence; (of a rhythm or something which varies rhythmically) cause (another) gradually to fall into synchronism with it; (n) (pronounced like french) enthusiasm or animation

		Lilo: (Brit) a type of inflatable mattress which is used as a bed or for floating in water

		Chockful: packed full to capacity

		Amaryllis: a bulbous plant with showy trumpet-shaped flowers and strap-shaped leaves

		Meniscus: the curved upper surface of a liquid in a tube; (meniscus lens) a lens that is convex on one side and concave in the other; a thin fibrous cartilage between the surfaces of some joints, eg the knee

		Rutted: having kind deep tracks made by the repeated passage of the wheels of vehicles

		Rectilinear: contained by, consisting of, or moving in a straight line or lines; (photography) relating to a straight line or lines; (of a wide-angle lens) corrected as much as possible, so that straight lines in the subject appear straight in the image

		Thoroughbred: (a,n) (of a horse) of pure breed, especially of a breed originating from English mates and Arab stallions and widely used as racehorses

		Buck: (n) the male of some horned animals, especially the fallow deer, roe deer, reindeer, and antelopes; a male hare, rabbit, ferret, rat, or kangaroo; another term for vaulting horse; a vertical jump performed by a horse, with the head lowered, back arched, and back legs thrown out behind; (archaic) a fashionable and spirited young man; (v) (of a horse) to perform a buck; (of a vehicle) make sudden jerky movements; oppose or resist (something oppressive or inevitable); (informal) (them up) make or become more cheerful; (a) (military slang) lowest of a particular rank

		Adduce: cite as evidence

		Bravura: great technical skill and brilliance shown in a performance or activity; virtuoso, masterly, dazzling; the display of great daring

		Concordance: (n) an alphabetical list of the words (especially the important ones) present in a text or texts, usually with citations of the passages concerned or with the context displayed in a computer scene; agreement or consistency; the inheritance by two related individuals (especially twins) of the same genetic characteristic, such as susceptibility to a disease; (v) makeba cincirdance of

		Phylum: (plu: phyla) a principal taxonomic category that ranks above class and below kingdom, equivalent to the division in botany; a group of languages related to each other less closely than those forming a family, especially one in which the relationships are unclear

		Impermissible: not permitted or allowed

		Micturate: urinate

		Coterminous: having the same boundaries or extent in space, time, or meaning

		Retractile: capable of being retracted

		Depilate: remove the hair from

		Depilatory: (a) used to remove unwanted hair; (n) a cream or lotion for removing unwanted hair

		Elastoplastic: relating to the state of stress between the elastic limit of a material and it's breaking strength, in which the material exhibits both elastic and plastic properties

		Cockatrice: another term for a basilisk; (heraldry) a mythical animal depicted as a two legged dragon (or wyvern) with a cock's head

		Duster: a cloth or pad for dusting furniture; a woman's loose, lightweight full-length coat without buttons, of a style originally worn in the 1920s when traveling in an open car; (NA) a short, light housecoat

		Curlicue: a decorative curl or twist in calligraphy or in the design of an object

		Suasion: persuasion as opposed to force or compulsion

		Caliper: an instrument for measuring external or internal dimensions, having two hinged legs resembling a pair of compasses and in-turned or out-turned points; a measuring instrument having one linear component sliding along another, with two parallel jaws and a vernier scale; a motor-vehicle or bicycle brake consisting of two or more hinged components; (Brit) a metal support for a person's leg

		Verbier: a small moveable graduated scale for optioning fractional parts of subdivisions on a fixed main scale of a barometer, sextant, or other measuring instrument

		Cast: (v) throw (something) forcefully in a specified direction; pitch, hurl, dash, shy, launch, propel; throw the hooked and baited end of (a fishing line) put into the water; let down (an anchor or sounding line); cause (light or shadow) to appear on a surface; direct (one's eyes or a look) at something; cause (uncertainty or disparagement) to be associated with something (eg: cast doubt on); discard; she's (skin or horns) in the process of growth; (of a horse) lose (a shoe); shape (metal or other material) by pouring it into a mound while molten; arrange and present in a specified form or style (eg: cast in tones of reason); register (a vote); (on country dancing) change one's position by moving a certain number of places in a certain direction along the outside of the line in which one is dancing; (of a dog) (for) search in different directions for a lost scent; let loose (hounds) on a scent; immobilize (an animal, especially a cow) by using a rope to cause it to fall on its side; (n) an object or mold used for casting; a bandage stiffened with plaster; the act of throwing something forcefully; a throw of a fishing line; a throw or a number thrown at dice; the firm or appearance of something, especially someone's features or complexion (eg: a masculine cast of countenance); the character of something or someone; a slight squint; a pellet regurgitated by a hawk or owl; a wide search made by a hound or pack of hounds to find a train; a pair or group of hawks or falcons

		Fantasticate: make (something) seem fanciful or fantastic

		Scurf: flakes on the surface of the skin that forms as fresh skin developed below, occurring especially as dandruff; a flaky deposit on a plant resulting from a fungal infection

		Gibbous: (of the moon) having the illuminated part greater than a semicircle and less than a circle; convex or protuberant (eg: gibbous eyes)

		Stopper: (n) a plug for sealing a hole, especially in the neck of a bottle or other container; (v) use a stopper to seal (a bottle or other container)

		Eschatology: the part of theology concerned with death, judgement, and the final destiny of the soul and of humankind (ety: from Greek "eskhatos" meaning "last")

		Spillikin: the game (in french) mikado

		Purfle: (n) an ornamental border, typically one inlaid on the back or belly of a violin; (archaic) an embroidered edge of a garment; (v) decorate (something) with an ornamental border

		Enthuse: express eager enjoyment, interest, or approval reagerding something; rave, gush, wax lyrical, effervesce, rhapsodize, eulogize, extol, laud, panegerize; make (someone) interested and eagerly appreciative; galvanize, rouse, stimulate, spur, incentivize

		Viscid: having a glutinous or sticky consistency

		Exophthalmic: having it characterized by protruding eyes

		Strontium: the chemical element of atomic number 38, a soft silver-white metal of the alkaline earth series. It's salts are used in fireworks and flared because they give a brilliant red light

		Culvert: (n) a tunnel carrying a stream or open drain under a road or railway; channel, conduit, watercourse, troucgh, drain, gutter; (v) channel (a stream or drain) through a culvert

		Capacious: having a lot of space inside; roomy, commodious, spacious, ample, substantial, vast, voluminous

		Bodkin: a thick, blunt needle with a large eye, used for drawing tape or cord through a hem; a long pin used for fastening the hair; (printing) a pointed tool used for removing pieces of metal type for correction; (archaic) a dagger

		Flue: a duct for smoke and waste gases produced by a fire, a gas heater, a power station, or other fuel-burning installation; duct, vent, chimney, pipeline, smokestack, outlet, inlet; a channel for conveying heat

		Runnel: a gutter; a brook or rill; a small stream of a particular liquid

		Dimity: a hard-wearing cotton fabric woven with stripes or checks

		Dyspnoea: difficult or labored breathing

		Embolism: obstruction of an artery, typically by a clot of blood or an air bubble

		Marriageable: fit or suitable for marriage, especially in being wealthy or of the right age

		Triumphal: made, carried out, or used in celebration of a great victory or achievement

		Subsidence: the gradual caving in or sinking if an area of land

		Recalcitrant: having an obstinately uncooperative attitude towards authority or discipline; (n) a person with a recalcitrant attitude

		Veridical: truthful; coinciding with reality

		Gravamen: the essence or most serious part of a complaint or accusation; a grievance

		Theodicy: the vindication of divine providence in view of the existence of evil; an attempt to answer the question of why a good God permits the manifestation of evil (ety: French "theodicée" the tile of a work by Leibniz)

		Tureen: a deep covered dish from which soup is served

		Suzerain: a sovereign or state having some control over another state that is internally autonomous; a feudal overlord

		Gusset: a piece of material sewn into a garment to strengthen or enlarge a part of it; a bracket strengthening an angle of a structure

		Rosette: a rose- shaped decoration, typically made of ribbon, worn by supporters of a sports team or political party or awarded as a prize; an object or arrangement resembling a rose, in particular: a carved or mounded ornament, a marking or group of markings, a radia arrangement of horizontally spreading leaves at the base of a low growing plant, a rose diamond

		Cordite: a smokeless explosive made from nitrocellulose, notroglycerine, and petroleum jelly, used in ammunition
		
		Procrustean: (especially of a framework or system) enforcing uniformity or conformity without regard to natural variation or individuality (ety: (Greek myth) after Procrustes, son of Poseidon, a rogue smith and bandit from Attica who attacked people by stretching them or cutting off their legs, so as to force them to fit the size of an iron bed

		Chilblain: a painful, itching swelling on a hand or foot, caused by poor circulation in the skin when exposed to cold

		Likeness: a portrait or representation; the fact or quality of being alike. Resemblance

		Asperity: harshness of tone or manner; harsh qualities or conditions

		Cogitation: the action of thinking deeply about something; deliberation, rumination, musing, reflection, pondering, brooding

		Fop: a man who is concerned with his clothes and appearance in an affected and excessive way; dandy, beau, glamour boy, bright young thing, rake, boulevardier, petit-maître, coxcomb

		Divine: (as v) discover (something) by guesswork or intuition; have supernatural or magical insight into (future events); foretell, predict, prophesy, presage, croak, auspicate, vaticinate; discover (water) by dowsing

		Prolix: (of speech or writing) using or containing too many words; tediously lengthy; protracted, verbose, ponderous, laborious, circumlocutory

		Amanuensis: a literary or artistic assistant, in particular one who takes dictation or copies manuscripts

		Wiglomeration: (from Bleak House) the endless process of the law

		Unawares: (as "caught [me] unawares") unexpectedly. Without being aware of a situation

		Lineament: a distinctive feature or characteristic, especially of the face; a linear feature on the earth's surface, such as a fault

		Expatiate: speak or write in detail about; expound, dwell on, elaborate on

		Phaeton: a light open four-wheeled horse-drawn carriage; (US) a vintage touring car

		Nosegay: a small bunch of flowers, typically one that is sweet scented

		Elfin: (a) (of a person or their face) small and delicate, typically with a mischievous charm; puckish, dainty, playful; relating to elves; a small North American butterfly that is typically brownish with markings on the wing margins that give the impression of scalloped edges

		Houri: a beautiful your woman, especially one of the virgin companions of the faithful in the Muslim paradise (ety: Arabic "'ahwar" meaning "having eyes with a marked contrast of black and white")

		Twain: archaic term for two

		Confabulate: engage in conversation. Talk; fabricate imaginary experiences as compensation for loss of memory

		Catalepsy: a medical condition characterized by a trance or seizure with a loss of sensation and consciousness accompanied by rigidity of the body

		Paviour: a paving stone; (archaic) a person who lays paving stones

		Nankeen: a yellowish cotton cloth; trousers made of nankeen; (archaic) the yellowish-buff cookout of nankeen

		Negus: a hot drink of port, sugar, lemon, and spice

		Encomium: a speech or piece of writing that praises someone or something highly; panegyric, paean, tribute, homage, laudation

		Harum scarum: (a,n) reckless. Impetuous; rash, hot-headed, hare-brained, foolhardy

		Betimes: (archaic) before the usual or expected time. early; sometimes. (North American) On occasion

		Repine: feel or express discontent. Fret; brood, lament

		Auriferous: (of rocks or minerals) containing gold

		Perdition: (in Christian theology) a state of eternal punishment and damnation into which a sinful and unrepentant person passes after death; complete and utter ruin

		Excrescence: a distinct outgrowth on a body or plant, resulting from disease or abnormality; an unattractive or superfluous object or feature; eyesore, monstrosity

		Benighted: in a state of pitiful or contemptible intellectual or moral ignorance; unenlightened, unlearned, uneducated, nescient; overtaken by darkness

		Effulgent: shining brightly. Radiant; (of a person or their expression) emanating joy or goodness

		Remand: (v) place (a defendant) in bail or in custody, esp. when a trial is adjourned; return (a case) to a lower court for reconsideration; (n) a commital to custody

		Exordium: the beginning or introductory part, esp. of a discourse or treatise

		Wadding: soft thick material used to line garments or pack fragile items, esp. cotton wool formed into a fleecy layer

		Stripling: (archaic, humorous) a young man

		Postilion: a person who rides the leading nearside (left hand side) horse of a team or pair drawing a coach or carriage, esp. when there is no coachman

		Scapegrace: (archaic) a mischievous or wayward person, especially a young person or child. A rascal

		Snooter: (from Wodehouse) snub (from snout meaning nose)

		Eftsoons: (archaic) soon afterwards

		Blighter: (British, informal) a person who is regarded with contempt, irritation, or pity

		Dickens: (informal, dated) used for emphasis, or the express annoyance or surprise when asking questions (eg: what the dickens is going on

		Stiles arrangement of steps that allows people but not animals to climb over a fence or walk; a vertical piece in the frame of a paneled door or sash window

		Apostrophe: an exclamatory passage in a speech or poem addressed to a person (typically one who is dead or absent) or thing (typically personified)

		Perry (Nabokov): "the lowest kind of author's minion [...] whose only purpose, whose only reason of being, is that they visit they places which the author wishes then to visit and meet the characters whom the author wishes the reader to meet"

		Pockmark: (n) a pitted scar or mark on the skin left by a pustule or spot; a scar, mark, or pitted area disfiguring a surface; (v) cover or disfigure with pockmarks

		Quiddity: the inherent nature or essence of someone or something; a distinctive feature. A peculiarity

		Fenland: land consisting of fens

		Fen: a low and marshy or frequently flooded area of land; fenland, wetland, bog, bogland, swamp, swampland, marsh, marshland, carr, bayou, moor, salina

		Illimitable: without limits or an end

		Tumulus: an ancient burial mound. A barrow

		Accrete: grow by accumulation or coalescence; for (a complete whole) by gradual accumulation; (with reference to matter or a body) come or bring together under the influence of gravitation

		Pollard: cut off the top branches of (a tree) to encourage new growth at the top

		Dado: the lower part of the wall of a room, below about waist height, when decorated differently from the upper part; short for dado rail: a decorative waist high moulding round the wall of a room, which also protects the wall from damage; the part of a pedestal between the base and the cornice

		Finicky: (of a person) fussy about their needs or requirements; fastidious, punctilious; showing or requiring great attention to detail

		Sedulous: (of a person or action) showing dedication and diligence; conscientious, scrupulous, painstaking, minute, assiduous, rigorous, scrupulous

		Macadam: broken stroke of even size, bound with tar or bitumen and used in successively compacted layers for surfacing roads and paths

		Popsy: (Brit, informal) an attractive young lady

		Aliment: (archaic) food; nourishment

		Bullion: gold or silver in bulk before coining, or valued by weight; ornamental braid or fringing made with twists of gold or silver thread

		Provisionally: subject to further confirmation; for the time being

		Particularize: treat individually or in detail; itemize, individuate, instance, distinguish

		Circumlocution: the use of many words where fewer would do, especially in a deliberate attempt to be vague or evasive; periphrasis, tautology, circuitousness, superfluity, pleonasm, perissology

		Environs: the surrounding area or district; vicinity, precincts, purlieus, vicinage

		Environ: surround; enclose, encircle, swathe, swaddle, wrap

		Yaw: (v, n) (of a moving ship or aircraft) twist or oscillate about a vertical axis

		Allotrope: each of two or more different physical forms in which an element can exist. Graphite, charcoal, and diamond are all allotropes of carbon

		Plucky: having or showing determined courage in the face of difficulties; brave, bold, daring, intrepid, game, valiant, lionhearted, gallant, stout, dauntless, resolute, heroic, indomitable, stalwart, mettlesome

		Splenetic: bad tempered, spiteful; ill humoured, wrathful, cross, irritable, irascible, choleric, dyspeptic, querulous, bilious, atrabilious, liverish, hostile

		Deliquescence: the process by which a substance absorbs moisture from the atmosphere until it dissolves in the absorbed water and forms a solution

		Barathea: a fine woolen cloth, sometimes mixed with silk or cotton, used chiefly for coats and suits

		Taffeta: a fine lustrous silk or similar synthetic fabric with a crisp texture

		Plethoric: excessive in quantity; superabundant

		Pabulum: bland or insipid intellectual matter, entertainment, etc.

		Lascar: a sailor from India or SE Asia

		Nonentity: a person or thing with no special or interesting qualities. An unimportant person or thing; the quality or condition of being uninteresting or unimportant; non-existence

		Punch and Judy: a traditional, popular, and usually violent puppet show featuring Pulcinella (Mr. Punch) and his wife Judy

		Chryselephantine: (of Ancient Greek sculpture) overlaid with gold or ivory

		Roundel: a small disc, esp. a decorative medallion; a picture or pattern contained in a circle; (heraldry) a plain filled circle as a charge (often with a special name according to color); a circular identifying mark painted in military aircraft, as, for example, the red, white, and blue of the RAF; a short poem consisting of theee stanzas of three lines each, rhyming alternately, with the opening words repeated as a refrain after the first and third stanzas. The form, a variant of the rondeau, was developed by Swinburne

		Jackal: a slender long-legged wild dog that feeds on carrion, game, and fruit and often hunts cooperatively, found in Africa and southern Asia

		Stertorous: (of breathing) noisy and labored

		Vinous: resembling, associated with, or fond of wine; resembling red-wine in color

		Meerschaum: a soft white clay-like material consisting of hydrated magnesium silicate, found chiefly in Turkey; a tobacco pipe with a bowl made from meerschaum

		Prig: a self-righteously moralistic person who behaves as if they are superior to others; prude, mrs Grundy, schoolmarm, Pharisee, Tartuffe

		Encaustic: (a) (in painting and ceramics) decorated by burning in colors as an inlay, esp. using colored clays or pigments mixed with hot wax; (n) the art or process of encaustic painting

		Groined: (of a vault) formed by the intersection of two barrel vaults, usually with plain groins without ribs

		Primogeniture: the state of being the firstborn child; the right of succession belonging to the firstborn child, esp. the feudal rule by which the whole real estate of an intestate passed to the eldest son

		Intestate: (n,a) (of a person) not having made a will before one dies

		Skinflint: (informal) a person who spends as little money as possible; miser, Scrooge, niggard, cheese-parer, pinchpenny

		Finial: a distinctive section or ornament at the apex of a roof, canopy, etc. on a building; an ornament at the top, end, or corner of an object

		Downland: gently rolling hill country, especially in southern England

		Portcullis: a strong, heavy grating that can be lowered down grooves on each side of a gateway to block it

		Waterfowl: ducks, geese, or other large aquatic birds, esp. when regarded as game

		Marigold: a plant of the daisy family with yellow, orange, or copper-brown flowers, cultivated as an ornamental

		Foghorn: a device making a loud, deep sound as a warning to ships in fog

		Lee: the sheltered side of something. The side away from the wind; shelter from wind or weather given by an object

		Commonalty: people without special rank or position, usually viewed as an estate of the realm; the general body of a group

		Wherefore: (archaic) for what reason; as a result of which

		Spout: (n) a tube or lip projecting from a container, through which liquid can be poured; nozzle, lip; a pipe through which water may be carried away or from which it can flow out; a sloping trough for conveying grain, coal, etc. to a lower level. A chute; (n,v) send out (liquid) forcibly in a stream; (of a liquid) flow out forcibly in a stream; spurt, gush, spew, erupt, pump, squirt, disgorge, belch forth; (of a whale or dolphin) eject (water vapor and air) through its blowhole; (v) express (one's views or ideas) in a lengthy, declamatory, and unreflective way; expatiate, pontificate, declaim, rant, sermonize, perorate

		Anon: (archaic, informal) soon, shortly

		Yon: (adv, determiner) yonder. That; (pronoun) yonder person or thing

		Hither and yon: (also hither and thither) in various directions, esp. in a disorganized way. Here and there

		Arrant: (dated) complete, utter; unqualified, downright, absolute, unmitigated outright, sheer, consummate, unadulterated, unalloyed

		Tope: drink alcohol to excess, especially on a regular basis

		Lees: the sediment of wine in the barrel. Dregs; the most worthless part or parts of something

		Ergo: therefore

		For the nonce: for the present, temporarily; provisionally, pro tem, ad interim

		Pro tem: for the time being

		Avast: (exclamation, nautical) stop. Cease

		Hustings: a meeting at which candidates in an election address potential voters; the campaigning associated with an election

		Circumambient: surrounding

		Abaft: (adv) in or behind the stern of a ship; (preposition) nearer the stern than. Behind

		Starboard: (n) (to) the side of a ship or aircraft that is on the right when one is facing forward; (v) turn (a ship or its helm) to starboard

		Port: (n) (to) the side of a ship or aircraft that is on the left when one is facing forward; (v) turn (a ship or its helm) to port

		Howdah: (in South Asia) a seat for riding on the back of an elephant or camel, typically with a canopy and accommodating two or more people

		Chrysalis: a quiescent insect pupa, esp. of a butterfly or moth; the hard outer shell enclosing a chrysalis; a transitional state

		Pupa: an insect in its inactive immature form between larva and adult

		Scrimshaw: (v) adorn ivory or shells with carved or colored designs; (n) scrimshawed ivory or shells

		Ever and anon: (archaic) occasionally

		Blubber: (n) the fat of sea mammals, esp. whales and seals; (informal) excessive human fat; (v) (archaic) (of a person's lips) swollen or protruding; (informal) cry noisily and uncontrollably. Sob

		Tackle: (as n) the equipment required for a task or sport; apparatus, paraphernalia, trappings, implements, contrivances, appurtenances; (Brit, humorous) a man's genitals; a mechanism consisting of ropes, pulley blocks, hooks, or other things for lifting heavy objects; windlass, sheave, pulley, hoist, block and tackle, crane, davit; the running rigging and pulleys used to work a boat's sail

		Isinglass: a kind of gelatin obtained from fish, especially sturgeon, and used in making jellies, glue, etc. and for fining real ale; (US) mica or a similar material in thin transparent sheets

		Scaramouche: a stick clown character of the commedia dell'arte combining characteristics of the Zanni (servant) and the Capitano (masked henchman)

		Farthingale: a hooped petticoat or circular pad of fabric around the hips, formerly worn under women's skirts to extend and shape them

		Quoin: (n) an external angle of a walk or building; any of the stones or bricks forming a quoin; a cornerstone; a wedge for raising the level of a gun barrel or for keeping it from rolling; (v) provide (a wall) with quoins or corners

		Tun: (n) a large beer or wine cask; a brewer's fermenting vat; an imperial measure of capacity, equal to 4 hogsheads; a large marine mollusk which has a rounded barrel like shell with broad spirals; (v, archaic) store (wine or other alcoholic drinks) in ab tun

		Pelisse: a woman's ankle length cloak with armholes or sleeves; a fur lined cloak, esp. as part of a hussar's uniform

		Phrenology: the detailed study of the shape and size of the cranium as a supposed indication of character and mental abilities

		Jungfrau: (plural: Jungfrauen) a virgin, a maiden

		Egress: (n) the action of going out or of leaving a place; a way out; another term for emersion; (v) (US) go out or leave (a place)

		Emersion: the process of emerging from water after being submerged; the reappearance of a celestial body after its eclipse or occultation

		Yaw: (n,v) (of a moving ship or aircraft) twist or oscillate about a vertical axis

		Warp and woof: the threads in a woven fabric composed of the warp (threads running lengthwise) and woof (threads running crosswise) to create the texture of fabric; (by extension) the fundamental structure of any process or system

		Triune: consisting of three in one (used especially with reference to the trinity)

		Doxology: a liturgical formula of praise to God

		Regale: entertain or amuse (someone) with talk; lavishly supply (someone) with food or drink

		Rap: (v) strike (a hard surface) with a series of rapid audible blows, especially to attract attention; (n) a quick, sharp knock or blow

		Metempsychosis: the supposed transmigration at death of the soul of a human being or animal into a new body of the same or a different species

		Morass: an area of muddy or boggy ground; quagmire, swamp, mire, bog, fen, slough, marsh; a complicated or confused situation; chaos, muddle, imbroglio, tangle

		Verdigris: a bright bluish-green encrustations or patina formed on copper or brass by atmospheric oxidation, consisting of basic copper carbonate

		Chirography: handwriting, esp. as distinct from typography

		Capstan: a broad revolving cylinder with a vertical axis used for winding a rope or cable, powered by a motor or pushed round by levers; the motor driven spindle on a tape recorder that makes the tape travel past the head at constant speed

		Multum in parvo: a great deal in a small space (ety: Latin for "much in little")

		Drat: a fairly mild expression of anger or annoyance (ety: shortening of "od rat" euphemism for "God rot")

		Prudential: involving or showing care and forethought, especially in business

		Aver: state or assert to be the case; allege as a fact in support of a plea

		Eponymous: (of a person) giving their name to something; (of a thing) named after a particular person or group

		Magian: (a) relating to the magi of ancient Persia; (n) a magus, or one of the Magi

		Magus: (hard "g", plu: magi, soft "g") a member of a priestly caste of ancient Persia; a sorcerer

		Freshet: the flood of a river from heavy rain or melted snow; a rush of fresh water flowing into the sea

		Transom: the flat surface forming they stern of a boat; a horizontal beam reinforcing the stern of a boat; a strengthening crossbar, in particular one set above a window or door; US term for transom window: a window set above the transom of a door or larger window. A fanlight

		Fanlight: a small semicircular or rectangular window over a door or another window; another term for skylight

		Skylight: a window set in a roof or ceiling at the same angle

		Breach: (as v, sense 2) (of a whale) rise and break through the surface of the water

		Aslope: (archaic, literary) in a sloping position

		Monadnock: an isolated hill or ridge or erosion-resistant rock rising above a peneplain

		Peneplain: a more or less level land surface produced by erosion over a log period, undisturbed by crustal movement

		Comber: (pronounced like "comb" /cöwmur/) long curling sea wave; a person or machine that prepares cotton or wool for manufacture by separating and straightening the fibres; (pronounced /komba/) a small fish that gapes when dead, occurring in shallow waters from the western English Channel to the Mediterranean

		Incommode: inconvenience (someone)

		Pukka: (informal) genuine; of or appropriate to high or respectable society; decorous, genteel, smart, comme il faut; (Brit) excellent

		Sheaf: (n) a bundle of grain stalks laid lengthways and tied together after reaping; a bundle of objects of one kind, especially papers; a bundle of objects of one kind, especially papers; bundle, bunch, stack, heap; (v) bundle into sheaves

		Purdah: the practice in certain Muslim and Hindu societies of screening women from men or strangers, esp. by means of a curtain; a curtain used for the purpose of purdah; a state of seclusion or secrecy; the period leading up o an election, during which government departments generally refrain from making any new announcements

		Slough: (n) (pronounced /slaow/) a swamp; (NA) a side channel or inlet, or a natural channel that is only sporadically filled with water; a situation characterized by lack of progress or acrtivity; (pronounced /slof/) (v) (off) shed or remove (a layer of dead skin); get rid of (something undesirable or no longer required); (of dead skin) drop off. Be shed; (down) (of soil or rock) collapse or slide into a hole or depression; (n) the dropping off of dead tissue from living flesh

		Babuism: the language, culture, or manners of the English-speaking native clerks of India, characterized by fluency with a misplaced eloquence and pathos which produces a ludicrous effect

		Flag: (as v, sense 2) become tired or less enthusiastic or dynamic; tire, falter, languish, wilt, droop, sag

		Periphrasis: the use of indirect or circumlocutory speech or writing; an indirect and circumlocutory phrase; the use of separate words to express a grammatical relationship that is otherwise expressed by inflection, eg: "did go" as opposed to "went" and "more intelligent" as opposed to "cleverer"

		Minatory: expressing or conveying a threat

		Phlox: a North American plant that typically has dense clusters of colorful scented flowers, widely grown as an alpine or border plant (ety: Latin for "flame")

		Hen scratch (also hen track): an illegible or scarcely legible mark intended as handwriting

		Folderol: trivial or nonsensical fuss; (dated) a showy but useless item

		Dovecote: a shelter with nest holes for domesticated pigeons

		Crenellation: the battlements of a castle or other building

		Triumphalism: excessive exultation over one's success or achievements (used especially in a political context)

		Gimcrack: (a, n) showy but cheap or badly made; shoddy, jerry-built, flimsy, ramshackle, tawdry, rubbishy, cheapjack

		Ramshackle: (especially of a house or vehicle) in a state of sever disrepair; tumbledown, dilapidated, derelict, ruinous, decrepit, neglected, gone to rack and ruin rickety, crumbling, decaying

		Cheapjack: (n) a seller of cheap inferior goods, typically a hawker at a fair or market; (a) of inferior quality

		Hawker: a person who travels about selling goods, typically advertising them by shouting; purveyor, peddled, tout, barrow boy, huckster, crier, colporteur

		Hawk: (as v) (of a person) hunt game with a train hawk; (of a bird or dragonfly) hunt on the wing for food; carry about and offer (goods) for sale, typically advertising them by shouting; clear the thrust noisily; bring phlegm up from the throat

		Purveyor: a person who sells or deals in particular goods; a person or group who spreads or promotes an idea, view, etc.

		Purvey: provide or supply (food, drink, or other goods) as one's business; spread or promote (an idea, view, etc.)

		Barrow boy: (Brit) a boy or man who sells wares from a barrow in the street

		Colporteur: a person who sells books, newspapers, and similar literature; someone employed by a religious society to distribute bibles and other religious tracts

		Aleatory: depending on the throw of a dice or on chance. Random; relating to or denoting music or other forms of art involving elements of random choice during their composition, production, or performance

		Snaggle-tooth: an irregular or projecting tooth; a small deep sea fish with large fangs at the front of the jaws and a number of light emitting organs on the body

		Snagged: (n) a tangled or knotted mass; (v) become knotted or tangled

		Scurryfunge: to rush around cleaning when company is on their way over

		Gestalt: an organized whole that is perceived as more than the sum of its parts

		Anacreontic: (a,n) (of a poem) written in te style of the Ancient Greek poet Anacreon, known for his celebrations of love and wine

		Ambitus: the exterior edge or periphery (as of a leaf, shell, etc.); the range of a melody or voice

		Trepverter: (Yiddish) a witty riposte or comeback thought of too late

		Sotto voce: (a, adv) (of singing or a spoken remark) in a quiet voice, as if not to be overheard

		Parturition: childbirth

		Slink (slunk, slunk): (v) move smoothly and quietly with gliding steps, in a stealthy or sensuous manner; (off) come or go unobtrusively or furtively; pussyfoot, sneak, creep, steal, slip, sidle; (n) a slinking movement or walk

		Billet: (n) a place, usually a civilian's house or other non military facility where soldiers are lodged temporarily; (v) lodge (soldiers) in a particular place, especially a civilian's house or nonmilitary facility

		Golliwog: a soft doll with bright clothes, a black face, and fuzzy hair

		In evidence: noticeable, conspicuous, striking, glaring, palpable

		Dotard: an old person, especially one who has become weak or senior

		Scatty: (informal) absentminded and disorganized (abbreviation of scatterbrained)

		Mimetic: relating to mimesis

		Mimesis: imitation, in particular: of the real world in art and literature; re deliberate imitation of the behavior of one group of people by another as a factor in social change; another term for mimicry

		Irreducible: not able to be reduced or simplified; not able to be brought to a certain form or condition

		Mons pubis: (abbreviated as mons) the rounded mass of fatty tissue lying over the joint of the pubic bones, in women typically more prominent and also called the mons veneris (ety: Latin "mount of the pubes")

		Prelapsarian: characteristic of the time before the Fall of Man (from the garden of Eden); innocent and unspoiled

		Conversant: (with) familiar or knowledgeable about something; au courant with, well versed in, au fait with, abreast of, cognizant with

		Bung: (n) a stopper for closing a hole in a container; (v) close with a stopper; block (something), typically by overfilling it

		Partake: (of) eat or drink (something); join in (an activity); (of) be characterized by (a quality) (eg: an event that partook of the mythic); suggest, evoke, evince, manifest

		Evince: reveal the presence of (a quality or feeling); (as evinced in) be evidence of, indicate; bespeak, manifest, demonstrate, evidence, attest to, convey

		Bespeak: (of an appearance or action) suggest, be evidence of; order or reserve (something) in advance; (archaic) speak to

		Bugger all: (rude) nothing

		Hamartia: a fatal flaw leading to the downfall of a tragic hero or heroine (ety: Greek meaning "fault, failure, guilt" used in Aristotle's Poetics with reference to Ancient Greek tragedy)

		Plonk: (informal) (v) set down heavily or carelessly; sit down heavily and without ceremony; play on a musical instrument laboriously or unskillfully; (n) cheap wine of inferior quality

		Emendation: the process of making a revision or correction to a text; a correction or revision to a text

		Steganography: the practice of concealing messages or information within other nonsecret text or data

		Bas relief: a kind of sculpture in which shapes are carved so that they are only slightly higher than the flat background

		Mendacity: untruthfulness

		Splint: (n) a strip of rigid material used for supporting and immobilizing a broken bone when it has been set; a long, thin strip of wood used to light a fire; (v) secure (a broken limb) with a splint

		Pageant: a public entertainment consisting of a procession of people in elaborate, colorful costumes, or an outdoor performance of a historical scene; (N American) a beauty contest; a scene erected on a fixed stage or moving vehicle as a public show

		Wad: (n) a lump or bundle of a soft material, used for padding, stuffing, or wiping; a disk of felt or another material used to keep powder or shot in place in a gun barrel; a portion of chewing gum, or of tobacco or a narcotic when used for chewing; a bundle of paper, banknotes, or documents; (informal) a large amount of something, esp. money; (v) compress (a soft material) into a lump or bundle; stop up (an aperture or a gun barrel) with a bundle or lump of soft material; line or stuff (a garment or piece of furniture) with wadding

		Viva voce: an oral examination, typically for an academic qualification

		Afflatus: a divine creative impulse or inspiration

		Albescent: growing or shading into white (eg: the albescent waves on the horizon) (ety: Latin "albus" meaning "white")

		Ewe: a female sheep

		Extempore: spoken or done without preparation; impromptu, spontaneous, ad lib, extenporary, extemporaneous, ad libitum

		Oracular: relating to an oracle; (of an utterance, advice, etc.) hard to interpret; enigmatic, obscure, abstruse, baffling, puzzling, perplexing, arcane, Delphic, equivocal; holding or claiming the authority of an oracle

		Soggy: wet and soft; mushy, swampy, marshy, boggy, miry

		Abeyance: a state of temporary disuse or suspension; the position of being without, or waiting for, an owner or claimant

		Tripartite: shared by or involving three parties; consisting of three parts

		Marginalia: marginal notes

		Brylcreem: a cream used on men's hair to give it a smooth, shiny appearance

		Ad libitum: more formal term for ad-lib (ety: Latin for "according to pleasure

		Ad-lib: (v,n,a,adv) speak or perform without previously preparing one's words; (a,adv) (music) (especially as a direction) wit free rhythm and expression; as much and as often as desired

		Cellarage: cellars collectively; money charged for the use of a cellar or storehouse

		Non sum qualis eram: (from Horace's Odes) I am not what I used to be

		Knimesis: the light, feather-like type of tickling as opposed to gargalesis

		Gargalesis: heavy tickling often leading to laughter

		Tesselate: decorate (a floor or pavement) with mosaics; cover (a plane surface) by repeated use of a single shape, without gaps or overlapping

		Tessera: a small block of stone, tile, glass, or other material used in a mosaic; (in Ancient Greece or Rome) a small tablet of wood or bone used as a token (ety: Greek "Tessares" meaning "four" for having four corners)

		Earshot: the range or distance over which can hear of be heard

		Hauliers: (Brit) a person or company employed in the transport of goods or materials by road; a miner who is responsible for transporting coal within a mine

		Lacebark: any of a number of trees or shrubs which possess a lacy bark or inner bark

		Porthole: a small window on the outside of a ship or aircraft; an opening for firing a cannon through

		Andiron: a metal stand, typically one of a pair, for supporting wood burning in a fireplace

		Chamfer: (v) (in carpentry) cut away (a right-angled edge or corner) to make a symmetrical sloping edge; (n) a symmetrical sloping surface at an edge or corner

		Gadroon: a decorative edging in metal or wood formed by parallel rounded strips (reeding) like inverted fluting

		Impasto: the process or technique of laying pain or pigment thickly so that it stands out from a surface; paint applied thickly

		Peddler: a person who sells illegal drugs or stolen goods; a person who promotes an idea or view persistently or widely

		Apophoenia: seeing patterns when there are none

		Quinine: a bitter crystalline compound present in cinchona bark, used as a tonic and formerly as an antimalatial drug

		Oriole: a type of bird typically having black and orange or yellow plumage

		Coracoid: a short projection from the shoulder blade in mammals, to which part of the biceps is attached

		Marl: (n) a mottled yarn of differently colories threads, or fabric made from this yarn; an unconsolidated sedimentary rock or soul consisting of clay and lime, formerly used as fertilizer; (v) apply marl to

		Gussy: (NA) (informal) make someone more attractive, especially in a showy or gimmicky way

		Porphyry: a large igneous rock containing crystals of feldspar in a fine-grained groundmass

		Missal: a book containing the texts used in the catholic mass throughout the year

		Lath: (n) a thin flat strip of wood, especially one of a series forming a foundation for the plaster of a wall; laths collectively; (v) cover with laths

		Boudoir: (historical, humorous) a woman's bedroom of small private room

		Valence: the combining power of an element, especially as measured by the number of hydrogen atoms it can displace or combine with; the number of grammatical elements with which a particular word, especially a verb, combines in a sentence (eg: "i gave it to him" "give" has a valency of 3

		Grisly: causing horror or disgust; gruesome, ghastly, frightful, hideous, macabre, grim, horrendous, dire, dreadful, abominable, loathsome

		Encrustation: the action of encrusting or state of being encrusted; a crust or hard coating on the surface of something; a facing of marble on a building

		Chitin: a fibrous substance consisting of polysaccharides, which is the major constituent in the exoskeleton of arthropods and the cell walls of fungi

		Arthropod: an invertebrate animal of the large phylum Arthropoda, such as an insect, spider, or crustacean

		Caryatid: a stone carving if a draped female figure, used as a pillar to support the entablature of a Greek or Greek-style building

		Hyperesthesia: excessive physical sensitivity, especially of the skin

		Sumpter: a pack animal

		Cavalcade: a formal procession of people walking in horseback, or riding in vehicles; cortège, procession

		Chamfron: the headpiece of a horse's bard

		Laity: lay people, as distinct from te clergy; ordinary people as distinct from professionals or experts

		Intractable: hard to control or deal with; (of a person) difficult or stubborn; obstinate, obdurate, inflexible, unyielding, unbending, uncompromising, recalcitrant

		Odoriferous: having or giving off a smell, esp. an unpleasant one

		Wassail: (n) spiced ale or mulled wine drunk during celebrations for twelfth night and Christmas Eve; lively and noisy festivities involving the drinking of plentiful amounts of alcohol; revelry; (v) drink plentiful amounts of alcohol and enjoy oneself with others in a noisy lively way; go from house to house at Christmas singing carols (ety: Middle English "waes hael" meaning "be in (good) health" to which one would reply "drinc hael" meaning "drink and be well")

		Vesper: evoking prayer; (archaic) evening; (literary) Venus as the evening star

		Kennel: (n) a small shelter for a dog; a pack of dogs; (v) put (a dog) in a kennel or kennels

		Certes: (archaic) assuredly; I assure you

		Gramercy: (archaic) used to express surprise or gratitude

		Depredation: the act of attacking or plundering

		Out-Herod: to exceed in violence or extravagance (usually used in the phrase "out-Herod Herod")

		Caracole: (n, v) a half turn to the right or left by a horse

		Nazarene: a native inhabitant of Nazareth; Jesus Christ; (chiefly in Jewish or Muslim use) a Christian; a member of an early sect of Jewish christians observing much of Jewish law; a member of a group of German painters formed in 1809 who sought to revive the art and techniques of medieval Germany and early renaissance italy

		Chaffer: haggle about the terms of an agreement or price of something

		Bonny: (a) (Scottish) attractive or beautiful (eg: a bonny lass); (of a baby) plump and healthy looking; sizeable (usually expressing approval) (eg: a bonny sum of money); (n) (literary) used as a form of address for one's bekovrd or baby

		Lass: (Scottish) a girl or young woman

		Nidering: (obsolete) dastardly, infamous

		Shaveling: (archaic, derogatory) a clergyman of priest with a tonsured head

		Foppery: foolish character or action

		Emprise: an adventurous, daring, or chivalric enterprise

		Recreant: (n, a) cowardly; unfaithful to a belief. Apostate

		Buckler: (historical) a small round shield held by a handle or worn on the forearm

		Contemn: treat or regard with contempt;  scorn, disdain, slight, deride, spurn

		Sylvan: consisting of or associated with woods. Wooded; pleasantly rural or pastoral

		Circumvallate: (v) surround with or as if with a rampart; (a) (literary) surrounded or surrounding as if by a rampart

		Cap a pie: literally, head to foot

		Dimity: a hard-wearing cotton fabric woven with stripes or checks

		Commodious: large and roomy; convenient (in archaic sense)

		Garrotte: kill (someone) by strangulation, typically with an iron collar or a length of wire or cord

		Detumescence: the process of subsiding from a state of tension, swelling, or (especially) sexual arousal

		Donnish: thought to resemble or suit a college don, particularly because of a  pedantic, scholarly manner

		Skirl: (of bagpipes) make a shrill, wailing sound

		Biro: a ballpoint pen

		Clime: a region considered with reference to its climate

		Raddled: (of a person or their face) showing signs of age or fatigue

		Fecundity: fertility; the ability to produce many new ideas

		Ponce: (n) (derogatory) an effeminate man; a man who lives off a prostitute's earning; (v) ask for or obtain (something to which one is not strictly entitled; live off a prostitute's earning

		Whomp: (v) strike heavily. Thump; defeat decisively

		Borstal: (British, historical) a custodial institution for young offenders

		Dermatitis: a condition of the skin in which it becomes red, swollen, and sore, sometimes with small blisters, resulting from direct irritation of the skin by an external agent or an allergic reaction to it

		Urbanite: (informal) à person who lives in a city or town

		Rhododendron: a shrimp or small tree of the Heath family, with large clusters of bell-shaped flowers, and typically with large evergreen leaves, widely grown as ornamental

		Clapped out: (British, informal) (of a vehicle, machine, or person) worn out from age or heavy use and unable to work or operate

		Heimisch: domestic (internal to a specific place) or homely

		Hausfrau: a housewife

		Hemiola: a musical figure in which, typically, two groups of three beats are replaced by three groups of two beats, giving the effect of a shift between two triple and duple metre; a 3/2 polyrhythms; a ratio of 1.5 to 1

		Disarray: (n) a state of disorganization or untidiness; (v) throw into a state of disorganization or untidiness; undress (someone)

		Demurrage: a charge payable to the owner of a chartered ship on failure to load or discharge the ship within the time agreed

		Parse: (v) resolve (a sentence) into its component parts and describe their syntactic roles; analyse (a string or text) into logical syntactic components; (n) an act of parsing a string or text

		Vest: confer or bestow (power, authority, property, etc.) on someone; give (someone) the legal right to power, property, etc.; (of power, property, etc.) come into the possession of; (of a chorister or member of the clergy) put on vestments; dress (someone)

		Rickets: a disease of children caused by vitamin D deficiency, characterized by imperfect calcification, softening, and distortion of the bones typically resulting in bow legs

		Apocryphal: (of a story or statement) of doubtful authenticity, although widely circulated as being true; of or belonging to the apocrypha

		Lights: the lungs of sheep, pigs, or bullocks, used as good, especially for pets

		Pareidolia: psychological phenomenon in which the mind perceives a familiar pattern where non exists (e.g. Jesus on toast)

		Floccinaucinihilipilification: the action of habit of estimating something as worthless (ety: words meaning "at little value" listed in a well-known rule of the Eton Latin grammar)

		Escrow: (n) a bond, deed, or other document kept in the custody of a third party and taking effect only when a specified condition has been fulfilled; a deposit or fund held on trust or as a security; (in escrow) the state of being in escrow; (v) place in custody or trust until a specified condition has been fulfilled

		Ledger: (n) a book or other collection of financial accounts; a flat stone slab covering a grave; a horizontal scaffolding pole, parallel to the face of the building; a weight used on a fishing line without a float to anchor the bait to a particular place; (v) fish using a ledger

		Audiate: the process of audiation, describing the sensation of hearing or feeling sound when it is not physically present

		Mondegreen: a misunderstood or misinterpreted word or phrase resulting from a mishearing of the lyrics of a song (ety: from "lady mondegreen" a misinterpretation of " laid him on the green" from the traditional ballad "the Bonny earl of Murray")

		Solfeggio: an exercise in singing using sol-fa syllables

		Saccade: a rapid movement of the eye between fixation points

		Grace note: an extra note added as an embellishment and not essential to the harmony or melody

		Shibboleth: a custom, principle, or belief distinguishing a particular class or group of people, especially a long standing one regarded as outmoded or no longer important

		Woodshed: (n) a shed where wood for fuel is stored; (v) (of a musician) practice in private; improvise or harmonize spontaneously

		Fledge: (of a young bird) develop wing feathers that are large enough for flight; brig up (a young bird) until it's wing feathers are developed enough for flight

		Fledged: able to fly; (of a person or thing) having just taken on the risks specified; (of an arrow) fitted with feathers

		Rem acu tetigisti: you hit the nail on the head (ety: Latin "you have touched the matter with a needle")

		Lingua franca: a language that is adopted as a common language between speakers whose native languages are different; (historical) a mixture of Italian with French, Greek, Arabic, and Spanish, formerly used in the eastern Mediterranean

		Geotropism: the growth of the parts of plants in response to the force of gravity, "positive" for roots, "negative" for the upward growth of plant shoots

		Shoot: (as n) a young branch or sucker springing from the main stock of a tree or other plant; sprout, offshoot, scion, bud, spear, tendril, sprig, cutting

		Synesthesia: a perceptual phenomenon in which stimulation of one sensory or cognitive pathway leads to automatic, involuntary experiences in a second sensory or cognitive pathway

		Steganography: the practice of concealing messages or information within other non-secret text or data

		Pizzicato: (adv, a, n) plucking the strings of a violin or other stringed instrument with one's finger

		Aphantasia: lacking a mind's eye

		Klangfarbenmelodie: musical technique consisting in splitting a musical line or melody between several instruments

		Hypnagogic: relating to the state immediately before falling asleep (ety: Greek "hupnos+agogos" meaning "leading+sleep"

		Timbre: the character or quality of a musical sound or voice as distinct from its pitch and intensity; the distinctive quality or character of someone or something

		Quodlibet: (archaic) a topic for exercise in philosophical or theological discussion; (literary) a light-hearted medley of well known tunes

		Behove: it is a duty or responsibility for someone to do something; it is appropriate or suitable, it befits

		Tessitura: the range within which most notes of a vocal part fall

		Photism: a hallucinatory sensation or vision of light

		Quale/qualia: a quality or property as perceived or experienced by a person

		Volta: in a sonnet, the turn of thought or argument (between the octave and the sextet in Petrarchan sonnets, before the final couplet in Shakespearean sonnets)

		Bramble: (n) a prickly scrambling shrub of the rose family, especially a blackberry; (v) (Brit) gather blackberries

		Bumpkin: an unsophisticated or socially awkward person from the countryside

		Bathos: (especially in a literary work) an effect of anticlimax created by an unintentional lapse from the sublime to the trivial or ridiculous

		Bower: (n) a pleasant shady place under plants in a garden or wood; a summer house or country cottage; a woman's private room or bedroom; (v) shade or enclose (a place or person)

		Rabble: a mob, a disorderly crowd; ordinary people, especially when regarded as socially inferior or uncouth; a large group of butterflies

		Hippocrene: used to refer to poetic or literary inspiration (ety: literally "fountain of the horse" the name of a fountain sacred to the muses, which according to legend was produced by a stroke of Pegasus' hoof)

		Theriomorphic: (esp. of a deity) having an animal form (ety: Greek "therion" meaning "wild beast")

		Exordium: the beginning or introductory part, esp. if a discourse or treatise

		Nescient: lacking knowledge. Ignorant

		Benight: to overtake by darkness or night, esp. before the end of a journey; to envelop in intellectual, moral, or social darkness

		Pietàs: respect due to an ancestor, country, institution, etc.

		Greensward: grass-covered ground

		Sward: an expanse of short grass

		Locus amoenus: literary term referring to an idealized place of safety or comfort, usually a shady lawn orbopen woodland, or a group of idyllic islands (ety: Latin meaning "pleasant place")

		Ekphrastic: an ekphrastic poem is a vivid description of a scene or, more commonly, a work of art

		Twitch: (v,n) give or cause to give a short, sudden jerking or convulsive movement;  shudder, spasm, tremble, shiver, quiver; cause to move in a specified direction by giving a sharp pull (eg: he twitched a cigarette out of a packet); use a twitch to subdue (a horse); (n) a sudden sharp sensation; a pang; a small noose attached to a stick, which may be twisted around the upper lip or the ear of a horse to subdue it during veterinary procedures

		Arethusa: a water nymph who was turned into a river by alpheus while he chased her

		Strumpet: (archaic, humorous) a female prostitute or a promiscuous woman

		Aition: myth that explains the origin of something (also called etiological myth)

		Tilth: cultivation of land. Tillage; the condition of tilled soil, especially in respect to suitability for sowing seeds (e.g.: to be of the right tilth); prepared surface soil

		Combe: (Brit) a short valley or hollow on a hillside or coastline, especially in southern England; (geology) a dry valley in a limestone or chalk escarpment

		Grave (graved, graven): (as v) engrave (something) on a surface; fix (something) indelibly in the mind

		Chrysolite: a yellowish-green or brownish variety of olivine, used as a gemstone

		Olivine: an olive-green, grey-green, or brown mineral occurring widely in basalt, peridotite, and other basic igneous rocks. It is a silicate containing varying proportions of magnesium, iron, and other elements

		Peridotite: a dense, coarse-grained plutonic rock containing a large amount of olivine, believed to be the main constituent of the earth's mantle

		Bark: (n) a dog's bark; tree bark; thin sheets of chocolate topped with ingredients such as nuts, confectionery, and dried fruit and broken into irregular pieces; (also barque) a sailing ship, typically with three masts, in which the foremast and mainmast are square-rigged and the mizzenmast is rigged fore and aft; a boat; (v) utter (a command or question) abruptly or aggressively; (US) call out in order to sell or advertise something; strip the bark from (a tree or piece of wood); scrape the skin off (one's shin) by accidentally hitting it against something hard

		Pent: another term for pent-up; (of emotions, energy, etc.) unable to be expressed or released; closely confined or repressed; stifled, smothered, bridled, curbed

		Madcap: (a) amusingly eccentric. Zany; done without considering the consequences. Foolish or reckless; rash, heedless, foolhardy, senseless; (n) an eccentric or reckless person

		Naiad: (in classical mythology) a water nymph said to inhabit a river, spring, or waterfall; the aquatic larva or nymph of a dragonfly, mayfly, or stonefly; a submerged aquatic plant with narrow leaves and minute flowers

		Nereid: sea nymphs, daughters of Nereus and Doris, who often accompany Poseidon, and can be friendly and helpful to sailors

		Satyr: one of a class of lustful, drunken woodland gods. In Greek art, they were represented as a man with a horse's ears and tail, but in Roman representations as a man with a goat's ears, tail, legs, and horns; a man who has strong sexual feelings; a satyrid butterfly with dark brown wings

		Wold: (in Britain) a piece of high, open uncultivated land or moor

		Whelm: (archaic) (v) engulf, submerge, or bury; well of or flow; (n) an act or instance of flowing or heaping up abundantly; a surge

		Dyke: (n) a long walk or embankment built to prevent flooding from the sea; a low wall or earthwork serving as a boundary or defence; a causeway; a ditch or watercourse; an intrusion of igneous rock cutting across existing strata; (v) provide (land) with a wall or embankment to prevent flooding

		Theophany: a visible manifestation of a god to humankind

		Cincture: a girdle or belt; a ring at either end of a column shaft

		Bestride: stand astride over. straddle; sit astride on; dominate

		Dewdrop: a drop of dew

		Score: (as n) a large number of something; a set or group of about twenty; (n,v) a notch  or line cut or scratched into a surface; (v) delete text by drawing a line through it

		Chink: (n) a narrow opening, typically one that admits light; break, aperture, fissure, crevice, cranny, rift, cleft, split; a beam or patch of light admitted by a narrow opening; a high-pitched ringing sound; (v) make or cause to make a light, high-pitched ringing sound, as of glasses or coins striking together; rattle, clunk, jingle, jangle

		Chachka: (yiddish) an inexpensive showy trinket; an attractive, unconventional woman

		Epenthesis: the insertion of a sound or letter within a word

		Shin: (n) the front of the leg below the knee; a cut of beef from the lower part of a cow's leg; (v) climb quickly up or down by gripping with one's arms and legs; clamber, scramble, scrabble, scale, claw one's way up, shinny

		Scrabble: (v) scratch or grope around with one's fingers to find, collect, or hold onto something; rummage, root, scavenge, fumble, clamber, scramble; (of an animal) scratch at something with its claws; scramble or crawl quickly; make great efforts to get somewhere or achieve something; (n) an act of scratching or scrambling for something

		Cater-cornered: (a, adv) situated diagonally opposite someone or something

		Clangor: a continuous loud banging or ringing sound

		Cagey: (informal) reluctant to give information owing to caution or suspicion; guarded, secretive, tight-lipped, circumspect, chary, wary, evasive

		Muss: (informal) make (someone's hair or clothes) untidy or messy; ruffle, tousle, dishevel, rumple, tumble

		Chuff: (of a steam engine) move with a regular sharp puffing sound

		Scabrous: rough and covered with, or as if with, scabs; unpleasant or unattractive;  indecent or salacious

		Cluck: (v,n) (of a hen) make a short, low sound; (of a person) make a short, low sound with one's tongue to express concern or disapproval; (v) express fussy concern about; (n) (informal) a foolish person

		Lunar: of, determine by, or resembling the moon

		Clump: (n) a small group of trees or plants growing closely together; cluster, tuft, tussock, thicket, bunch; another term for clomp; a small, compact group of people; a compacted mass or lump of something; a thick extra sole on a boot or shoe; (v) form a clump or clumps

		Clomp; (v) walk with a heavy tread; (n) the sound of a heavy tread

		Fob: (off with) deceitfully attempt to satisfy someone by making excuses or giving them something inferior; give (someone) something inferior to or different from what they want

		Cockeyed: (informal) crooked or askew. Not level; lopsided, askew, awry; absurd, impractical; (of a person or their eyes) having a squint

		Oblate: (of a spheroid) flattened at the poles

		Echolalia: meaningless repetition of another person's spoken words as a symptom of psychiatric disorder; repetition of speech by a child learning to talk

		Grotesque: (a) comically or repulsively ugly or distorted; twisted, gnarled, unsightly; incongruous or inappropriate to a shocking degree; ludicrous, preposterous; (n) a very ugly or comically distorted figure or image; a style of decorative painting or sculpture consisting of the interweaving of human and animal forms with flowers and foliage

		Telos: an ultimate object or aim

		Dyspepsia: indigestion

		Miosis: excessive construction of the pupil of the eye

		Litote: ironic understatement in which an affirmative is expressed by the negative of its contrary (eg: I shan't be sorry for I shall be glad)

		Ressentiment: a psychological state resulting from suppressed feelings of envy and hatred which cannot be satisfied (Nietzsche)

		Manger: a long trough from which horses or cattle feed

		Tmesis: the separation of parts of a compound word by an intervening word or words, used mainly in informal speech for emphasis (eg: any-blooming-where)

		Glyph: a hieroglyphic character or symbol; an ornamental carved groove or channel, as in a Greek frieze

		Chiasmus: a rhetorical or literary figure in which words, grammatical constructions, or concepts are repeated in reverse order. (Eg: ask not what your country can do for you; ask what you can do for your country)

		Obverse: (n) the side of a coin or medal bearing the head or principal design; the design or inscription on the principal side of a coin; the opposite or counterpart of a fact or truth; (a) of or denoting the obverse of a coin or medal; corresponding to something else as it's opposite or counterpart

		Ecstasy: an overwhelming feeling of great happiness or joyful excitement; an emotional or religious frenzy or trance-like state, originally one involving an experience of mystic self-transcendence (ety: Greek ekstasis meaning "standing outside oneself)

		Adamantine: unable to be broken

		Amethyst: a precious stone consisting of a violet or purple variety of quartz; a violet or purple color (ety: Greek amethustos meaning "not drunken" because the stone was believed to prevent intoxication)

		Marmoreal: made of or compared to marble

		Eidolon: an idealized person or thing; a spectre or phantom (ety: Greek eidos meaning form)

		Toto coelo: utterly (lit. by the whole extent of the heavens)

		Skein: a length of thread or yarn, loosely coiled and knotted; an element that forms part of a complex or complicated whole; a flock of wild geese or swans in flight, typically in a V-shaped formation

		Fidus Achates: a faithful friend or devoted follower

		Charon: the ferryman of Hades who carries souls if the newly deceased across the rivers Styx and Acheron that divided the world of the living from the world of the dead

		Marvel: (v) be filled with wonder or astonishment; (n) a wonderful or astonishing person or thing (ety: Latin mirari meaning "wonder at", then mirabillis, merveille)

		Caulk: (n) a waterproof filler and sealant, used in building work and repairs; (v) seal (a gap or seam) with caulk; make (a boat) watertight by stopping up any gaps in its hull

		Stygian: relating to the river Styx in Greek mythology; very dark

		Lethe: a river in hades whose waters cause drinkers to forget their past; oblivion, forgetfulness

		Lethean: causing oblivion or forgetfulness of the past

		Incipient: beginning to happen or develop; (of a person) developing into a specified role

		Pyrrhic: (of a victory) won at too great a cost to have been worthwhile for the victor; a metrical foot of two short or unaccented syllables

		Derrick: a kind of crane with a moveable pivoted arm for moving heavy weights, especially on a ship; the framework over an oil well or similar boring, holding the drilling machinery (ety: from Derrick, the surname of a London hangman)

		Percale: a closely woven fine cotton fabric

		Colonnade: a row of evenly spaced columns supporting a root, an entablature, or arches; peristyle, portico, arcade, loggia; a row of trees or other tall objects

		Loggia: a gallery or room with one or more open sides, esp. one that forms part of a house and has one side open to the garden

		Peristyle: a row of columns surrounding a space within a building such as a court or internal garden or edging a veranda or porch; a space such as a court or porch that is surrounded by a peristyle

		Arcade: a covered passage with arches along one or both sides; a covered walk with shops along one or both sides; a series of arches supporting a wall, or set along it

		Fluke: (n) an unlikely chance occurrence, especially a surprising piece of luck; twist of fate, lucky break; (v) achieve (something) by luck rather than skill

		Arboreal: living in trees; relating to trees

		Fulvous: reddish yellow; tawny

		Cinch: (n) (informal) an extremely easy task; a sure thing. A certainty; a girth for a western saddle or pack of a type used mainly in Mexico and the western US; (v) secure (a garment) with a belt; fix (a saddle) securely by means of a girth; (informal) make certain of

		Sod: (n) the surface of the ground with the grass growing on it; a piece of turf; (v) cover with sods or pieces of turf

		Ecumenical: representing a number of different Christian churches; non-sectarian; promoting or relating to unity among the world's Christian Churches

		Extant: still in existence; surviving, enduring

		Maenad: (in Ancient Greece) a female follower of Bacchus, traditionally associated with divine possession and frenzied rites

		Noumenon: (in Kantian philosophy) a thing as it is in itself, as distinct from a thing as it is knowable by the senses through phenomenal attributes

		Liminal: relating to a transnational or initial stage of a process; occupying a position at, or on both sides of, a boundary or threshold

		Diatonic: (of a scale, interval, etc.) involving only notes proper to the prevailing key without chromatic alteration; (of a melody or harmony) constructed from a diatonic scale

		Anacrusis: one or more unstressed syllables at the beginning of a verse; one or more unstressed notes before the first bar line of a piece or passage

		Certiorari: a writ or order by which a higher court reviews a case tried in a lower court

		Logos: the word of god, or principle of divine reason and creative order, identified in the gospel of John with the second person of the trinity incarnate in Jesus Christ; (in Jungian philosophy) the principle of reason and judgement, associated with the animus

		Prerogative: (n) a right or privilege exclusive to a particular individual or class; (as royal prerogative) the right of the sovereign; a faculty or property distinguishing a person or class; (a) arising from the prerogative of the crown and based in common law rather than statutory law

		Riptide: another term for rip: a stretch of fast-flowing and rough water in the sea or in a river, caused by the meeting of currents; short for rip current: an intermittent strong surface current flowing seaward from the shore

		Fury: wild or violent anger; wrath, spleen, rage, frenzy, indignation, ire, bile; a surge of violent anger or other strong feeling; extreme strength or violence in an action or a natural phenomenon; (Greek mythology) a spirit of punishment, often represented as one of three goddesses who pronounced curses on the guilty and inflicted famines or pestilences. The furies were identified at an early date with the Eumenides

		Gumption: (informal) shrewd or spirited initiative and resourcefulness

		Priestcraft: (derogatory) the knowledge and work of a priest

		Tutelage: protection of or authority over someone or something. Guardianship; instruction. Tuition

		Legation: a diplomatic minister, esp. one below the rank of ambassador, and their staff; the official residence of a diplomatic minister

		Dominion: sovereignty or control; the territory of a sovereign or government; each of the self-governing territories of the British commonwealth

		Ascendency: occupation of a position of dominant power or influence

		Lollygag: (informal) spend time aimlessly. Idle; dawdle

		Excise: (n) a tax levied on certain goods and commodities produced or sold within a country and on licences granted for certain activities; (v) charge excise on (goods)

		Elide: omit (a sound or syllable) when speaking; (into) join together. Merge

		Delve: reach inside a receptacle and search for something; research or make painstaking enquiries into something; (archaic) dig, excavate

		Pertinacious: holding firmly to an opinion or a course of action; tenacious, persistent, resolute, dogged, unrelenting, implacable, unyielding, mulish, obstinate, obdurate, unbending

		Prime: (as v) make something ready for use or action, in particular: prepare (a firearm or explosive device) for firing or detonation; cover (a surface) with a primer; pour or spray liquid into (a pump) before starting in order to seal the moving parts and facilitate its operation; inject extra fuel into (the cylinder or carburetor of an internal combustion engine) in order to facilitate starting; induce a susceptibility or proclivity in (an animal, person, or tissue); prepare (someone) for a situation, typically by supplying them with relevant information

		Gorse: a yellow-flowered shrub of the pea family, the leaves of which are modified to form spines, native to Western Europe and North Africa

		Canter: (n) a pace of a horse or other quadruped between a trot and a gallop, with not less than one foot on the ground at any time; a ride on a horse at a canter; (v) (of a horse) move at a canter in a particular direction; make (a horse) move at a canter (ety: from Canterbury pace/gallop

		Spinney: (Brit) a small area of trees and bushes

		Nautilus: a cephalopod mollusk with a light external spiral shell and numerous short tentacles around the mouth; another term for argonaut

		Rung: a horizontal support on a ladder for a person's foot; a level in a hierarchical structure, esp. a class or career structure; a strengthening crosspiece in the structure of a chair

		Dithyramb: a wild choral hymn of Ancient Greece, esp. one dedicated to Dionysus; a passionate or inflated speech, poem, or other writing

		Crocus: a small spring-flowering Eurasian plant of the iris family, which grows from a corm and bears bright yellow, purple, or white flowers

		Corm: a rounded underground storage organ present in plants such as crocuses, gladioli, and cyclamens, consisting of a swollen stem base covered with scale leaves

		Goodly: considerable in size or quantity; (archaic) attractive, excellent, or admirable

		Plutus: Greek god of wealth (often conflated with Pluto, also god of wealth (I.e. Plutocracy))

		Ghazal: (in middle eastern and Indian literature and music) a lyric poem with a fixed number of verses and a repeated rhyme, typically on the theme of love, and normally set to music

		Geminate: (n) consisting of identical adjacent speech sounds. Doubled; (v) double or repeat (a speech sound)

		Trice: (as "in a trice") in a moment. Very quickly

		Knurl: a small projecting knob or ridge, esp. in a series around the edge of something

		Erotes: (in Greek mythology, equivalent of Roman cupids and psyches) plural or Eros ("love, desire",) a collective of winged gods associated with love and sexual intercourse, part of aphrodite's retinue. They include Anteros ("love returned") who punished those who scorn love and others' advances, Himeros ("impetuous love" or "pressing desire") representing unrequited love, Hedyglos ("sweet-talk" or "flattery"), Hymenaios or Hymen ("bridal-hymn") from which comes out word "hymen", Hermaphoditus ("Hermaphrodite" or "effeminate"), and Pothos ("desire, longing," esp. for one who is absent.) who carries a vine, indicating a connection to wine or Dionysus

		Galena: a bluish, grey, or black mineral of metallic appearance, consisting of lead sulphide. It is the chief ore of lead

		Welter: (v) move in a turbulent fashion; lie soaked in blood; (n) a large number of items in no order. A confused mass; jumble, tangle, clutter, mishmash, hotchpotch a state of general disorder

		Bedabbled: (archaic) stain or splash with  dirty liquid or blood

		Wight: a spirit, ghost, or other supernatural being

		Trestle: a framework consisting of a horizontal beam supported by two pairs of sloping legs, used in pairs to support a flat surface such as a table top; shirt for trestle table; (as trestlework) an open braced framework used to support an elevated structure such as a bridge; (as trestletree) each of a pair of horizontal pieces on a sailing ship's lower mast supporting the topmast

		Murrain: redwater fever or a similar infectious disease affecting cattle or other animals; (archaic) a plague, epidemic, or crop blight; the potato blight during the Irish famine in the mid 19th century

		Cadge: (v, Brit, informal) ask for or obtain (something to which one is not strictly entitled); mooch, scrounge; (n) a padded wooden frame on which hooded hawks are carried to the field

		Salve: (n) an ointment used to promote healing of the skin or as protection; balm, unction, balsam, pomade, liniment, emollient, embrocation; something that is soothing or consoling for wounded feelings or an uneasy conscience; (v) soothe (wounded pride or one's cinscience); allay, ease, palliate, mitigate, assuage; (archaic) apply salve to

		Toggle: (n) a short rod of wood or plastic sewn to one side of a coat or other garment, pushed through a hole or loop on the other side and twisted so as to act as a fastener; a pin or other crosspiece put through the eye of a rope or a link of a chain to kept it in place; a kind of wall fastener having a part that springs open or turns through 90 degrees after it is inserted to prevent withdrawal; computing sense of the word; (v) provide or fasten with toggles

		Coulter: a vertical cutting blade fixed in front of a ploughshare; the part of a seed drill that makes the furrow for a seed

		Flagon: a large container in which drink is served, typically with a handle and spout; the amount of liquid held in a flagon; a container similar to a flagon used to hold the wine for the Eucharist (from french "flacon")

		Wroth: (archaic) angry

		Ravel: (v) untangle something; unravel. Fray; confuse or complicate (a question or situation; (n) a tangle, cluster, or knot

		True: (as v) bring (an object, wheel, or other construction) into the exact shape or position required

		Afield: to or at a distance; in the field (in reference to hunting)

		Thew: muscular strength; (as thews) muscles and tendons perceived as generating strength

		Carrion: the decaying flesh of dead animals (French: charogne)

		Tomfoolery: foolish or silly behavior; buffoonery, skylarking, shenanigans, harlequinade

		Skylark: (n) a common Eurasian and North African lark of farmland and open country, noted for its prolonged song given in hovering flight; (v) pass time by playing tricks or practical jokes; indulge in horseplay

		Promontory: a point of high land that juts out into the sea or a large lake; headland, cape, bill, foreland, peninsula, overhang, mull, spur, bluff; a protuberance on an organ or other bodily structure

		Peninsula: a piece of land almost surrounded by water and projecting out into a body of water

		Ness: a headland or promontory

		Foreland: an area of land bordering on another or lying in front of a particular feature; a cape or promontory; a stable unyielding block of the earth's crust, against which compression produces a folded mountain range

		Headland: a narrow piece of land that projects from a coastline into the sea; a strip of land left unploughed at the end of a field

		Dew: (n) tiny drops of water that form on cool surfaces at night, when atmospheric vapor condenses; a beaded or glistening liquid resembling dew; (v) moisten with drops of liquid

		Bivouac: (n) a temporary camp without tents or cover, used especially by soldiers or mountaineers; (v) stay in a bivouac

		Subaqueous: existing, formed, or taking place under water; lacking in substance or stength

		Transient: (a) lasting only for a short time; impermanent; evanescent, passing,  fugitive, fly-by-night, fugacious; (a,n) staying or working in a place for a short time only; (n) a momentary variation in current, voltage, or frequency

		Malthusian trap: theory that as population grows and surpasses agricultural growth, there must be a stage when food supply is inadequate

		Gambrel: a roof with two sides, each of which has a shallower slope above a steeper one

		Lo and behold: used to present a new scene, situation, or turn of events, often with the suggestion that, though surprising, it could in fact have been predicted

		Lo: (archaic) used to draw attention to an interesting or amazing event

		Cozen: trick or deceive; obtain by deception

		Roister: enjoy oneself or celebrate in a noisy or boisterous way; revel, carouse, frolic, romp, rollick

		Nestor: a king of Pylos who serves in his old age as a counselor to the Greeks at Troy; (not capitalized) one who is a patriarch or leader in a field

		Beseem: to be appropriate for. Befit

		Fulsome: complimentary or flattering to an excessive degree; profuse, lavish, gushing, immoderate, fawning, ingratiating, adulatory, laudatory, effusive, cloying, unctuous, saccharine, honeyed; a large size or quantity. Generous or abundant

		Pitfall: a hidden or unsuspected danger; a covered pit for use as a trap

		Jacobin: a member of a democratic club established in Paris in 1789. They were the most radical and ruthless of the political groups formed in the wake of te French Revolution, and in association with Robespierre they instituted the Terror of 1793-4; an extreme political radical; two different sorts of birds

		Tall tale: a story with unbelievable elements, related as if it were true and factual

		Armada: a fleet of warships

		Wunderkind: a person who achieves great success when relatively young

		Inbreathe: breathe or absorb

		Surcease: (archaic) (n) ending. Cessation; (v) stop. Cease

		Victual: (pronounced "vittal") (n) food or provisions; (v) provide with food or other stores; (archaic) eat (ety: Latin "victus" meaning "food"

		Bandy: (n) (of a person's legs) curved outwards so that the knees are wide apart; (of a person) having bandy legs; (v) pass on or discuss (an idea or rumor) in a casual or uninformed way

		Nepenthes: a drug described in Homer's odyssey as banishing grief or trouble from a person's mind; a drug or potion bringing welcome forgetfulness; a plant of a genus that comprises the old world pitcher plants (ety: Greek "ne + penthes" meaning "not + grief")

		Guerdon: (archaic) (n) a reward or recompense; (v) give a reward to (someone)

		Darkling: growing dark or characterized by darkness

		Ambrosia: the food of the gods; something very pleasing to taste or smell; another term for bee bread

		Hecatomb: (in Ancient Greece or Rome) a great public sacrifice, originally of a hundred oxen; an extensive loss of live for a particular cause; (ety: Greek "hekaton + bous" meaning "hundred + ox")

		Gad: (informal) (about) go from place to place in the pursuit of pleasure

		Retail: (n,v) the sale of goods to the public in relatively small quantities for use or consumption rather than for resale; (v) relate the details of (a story or incident) to others

		Pellucid: translucently clear; crystalline, limpid, unclouded; easily understood. Limpid; (of music or other sound) clear and pure in tone

		Envisage: contemplate or conceive as a possibility or a desirable future event; form a mental picture of (something not yet existing or known)

		Mentor: (n) an experienced and trusted advisor; (v) advise or train (someone, especially a younger colleague) (ety: from Greek, the name of the man who Pallas Athene is disguised as when she advises Telemachus)

		Lave: wash; (of water) wash against or over (something)

		Halyard: a rope used for raising and lowering a sail, yard, or flag on a sailing ship

		Gobbet: (Brit) a piece or lump of flesh, food, or other matter; an extract from a text, especially one set for translation or comment in an examination

		Dissension: disagreement that leads to discord; friction, strife, disunion, antagonism

		Aloft: up in or into the air. overhead; skyward, heavenward, on high; up the mast or into the rigging of a ship

		Poop: (n) the aftermost and highest deck of a ship, especially in a sailing ship where it typically forms the roof of a cabin in the stern; (v) (of a wave) break over the stern of (a ship), sometimes causing it capsize

		Crag: a steep or rugged cliff or rock face; bluff, ridge, precipice, overhang, pinnacle, promontory, headland, escarpment, eminence

		Estimable: worthy of great respect

		Smithy: a blacksmith's workshop; a forge

		Ferule: a flat ruler with a widened end, formerly used for beating children

		Proparoxytone: linguistic term for a word with stress in the antepenultimate (third last) syllable (eg: cinema, operational), related terms are paroxytone, and then oxytone. In English, most nouns of three or more syllables are proparoxytones, except in words ending in -tion or -sion that tend to be paroxytones. This tendency is so strong that it frequently leads to the stress moving to a different part of the root in order to preserve an antepenultimate stress (eg: photograph -> photography; family -> familiar)

		Nostoi: also known as Returns or Returns of the Greeks, is a lost epic of Ancient Greek literature. One of the Trojan cycle (between Iliou persis [sack of Ilium] and Odyssey)

		Internecine: destructive to both sides in a conflict; relating to conflict within a group

		Xenia: the Ancient Greek concept of unbounded hospitality (ety: Greek "guest-friendship")

		Diachronic: concerned with the way in which something, especially language, has developed and evolved through time

		Decollate: behead (someone); mechanically separate sheets of paper into different piles

		Precursor: a person or thing that comes before another of the same kind. a forerunner; a substance from which another is formed, especially by metabolic reaction

		Whited sepulcher: a hypocrite; a person inwardly corrupt or wicked but outwardly or professedly virtuous or holy (ety: simile in Matthew 23:27)

		Scullery: a small kitchen or room at the back of a house used for washing dishes and other dirty household work

		Dichotomy: a division or contrast between two things that are represented as being opposed or entirely different

		Circumfluent: flowing round. Surrounding

		Frontispiece: an illustration facing the title page of a book; the principal face of a building; a decorated entrance; a pediment over a door or window

		Villanelle: a pastoral or lyrical poem of nineteen lines, with only two rhymes throughout, and some lines repeated

		Tendril: a slender thread-like appendage of a climbing plant, often growing in a spiral form, which stretches out and twines round any suitable support; something resembling a plant tendril, especially a slender curl or ringlet of hair

		Flock: (n) a number of birds of one kind feeding, resting, or traveling together; flight, congregation; a number of domestic animals, especially sheep, goats, or geese, that are kept together; herd, drove, fold; a large number or crowd of people; a group of children or pupils in someone's charge; a Christian congregation or body of believers, esp. one under the charge of a particular minister; (v) (of birds) congregate in a flock; move or go together in a crowd

		Dray: a truck or cart without sides for delivering heavy loads

		Vesture: clothing. Dress

		Lambent: (of light or fire) glowing, gleaming, or flickering with a soft radiance

		Tundish: a broad open container or large funnel with one or more holes at the bottom, used especially in plumbing or metal-founding

		Hoydenish: (of a woman) having qualities or traits that are traditionally considered inappropriate for a girl or woman (eg: a hoydenish woman who smoked cigars and wore heavy work boots to town

		Prelate: a bishop or other high ecclesiastic dignitary

		Ciborium: a receptacle shaped like a shrine or a cup with an arched cover, used in the Christian church to hold the Eucharist; a canopy over an altar in a church, standing on four pillars

		Brittle: hard but liable to break easily; (of a person's voice) unpleasantly hard and sharp and showing signs of instability or nervousness; appearing decisive it cheerful but unstable or nervous within

		Sodality: a confraternity or association, esp. a Roman Catholic religious guild or brotherhood

		Thurible: a censer (container in which incense is burnt during a religious ceremony)

		Embay: (of the wind) force (a boat) into a bay; enclose (something) in a recess or hollow; formed into bays

		Cerement: waxed cloth for wrapping a corpse (first used in Hamlet); cerecloth

		Myrtle: an evergreen shrub which has glossy aromatic foliage and white flowers flowed by purple-black oval berries

		Vervain: a widely distributed herbaceous plant with small blue, white, or purple flowers and a long history of used as a magical and medicinal herb

		Offal: the entrails and internal organs of an animal used as food; waste material; decomposing animal flesh

		Embrasure: an opening in a walk or parapet which is beveled or splayed out on the inside, typically one around a window or door

		Desuetude: a state of disuse (eg: fall into desuetude)

		Balefire: a large open air fire

		Surd: (a,n) (of a number) irrational; (of a speech sound) uttered with the breath and not the voice (eg: f,k,p,s,t)

		Spikenard: a costly perfumed ointment much valued in ancient times; the Himalayan plant of the valerian family that produces the rhizome from whic spikenard was prepared; a plant resembling spikenard in fragrance

		Myrrh: a fragrant gum train obtained from trees and used, especially in the Near East, in perfumery, medicines, and incense; another term for sweet cicely

		Cicely: an aromatic white-flowered plant of the parsley family, with fern-like leaves

		Frankincense: an aromatic gum resin obtained from an African tree and burnt as incense

		Covetous: having or showing a great desire to possess something belonging to someone else; greedy, rapacious, desirous, green-eyed

		Simoom: a hot, dry, dust-laden wind blowing in the desert, especially in Arabia

		Wile: (n) devious or cunning stratagems employed in manipulating or persuading someone to do what one wants; tricks, ruses, ploys, scheme, manœuvres, gambit, subterfuge, cunning, stratagems, devices, artifices, contrivance; artfulness, art, guile, craftiness; (v) (archaic) lure. Entice; another way of saying "wile something away"

		Weltanschauung: a particular philosophy or view of life. The world view of an individual or group

		Auger: a tool resembling a large corkscrew, for boring holes in wood or the ground; a marine mollusc of warm seas with a slender tapering spiral shell

		Bore: (v) make (a hole) in something with a tool or by digging; drill, perforate, punch, tunnel, burrow, gouge (out); (out) hollow out (a gun barrel or other tube); of an athlete or racehorse) push another competitor out of the way; (n) the hollow part inside a gun barrel or other tube

		Borehole: a deep, narrow hole made in the ground, especially to locate water or oil

		Kith: one's relations

		Distaff: a stick or spindle on to which wool or flax is wound for spinning; of or concerning women

		Alms: (in historical contexts) money or food given to poor people

		Quern: a simple hand mill for grinding corn, typically consisting of two circular stones, the upper of which is rotated or rubbed to and fro on the lower one

		Burgess: (archaic) an inhabitant of a town or borough with full rights of citizenship; a magistrate or member of the governing body of a town

		Endue (also indue): endow or provide with a quality or ability

		Phoebus: apollo as the sun God; a personification of the sun

		Pallas: Athena, goddess of wisdom and useful arts, and prudent warfare (Roman: Minerva)

		Aphrodite: goddess of love, beauty, pleasure, and procreation (Roman: Venus)

		Gyve: (archaic) a fetter or shackle

		Abscond: leave hurriedly and secretly, typically to escape from custody or avoid arrest; (of a person on bail) fail to surrender oneself for custody at the appointed time; (of a colony of honeybees) entirely abandon a hive or nest

		Enjoin: instruct or urge (someone) to do something; urge, adjure, admonish, press, prod, goad, spur, command, entreat, exhort, implore, beseech, bid; prescribe (an action or attitude) to be performed or adopted; prohibit someone from performing (a particular action) by issuing an injunction

		Hilt: the handle of a weapon or tool, esp. a sword, dagger, or knife

		Scabbard: a sheath for the blade if a sword or dagger, typically made of leather or metal; a sheath for a gun or other weapon or tool

		Bedew: cover or sprinkle with drops of water or other liquid

		Moly: a Southern European plant related to the onions, with small yellow flowers; a mythical herb with white flowers and black roots, endowed with magic properties

		Circe: an enchantress, nymph, or goddess renowned for her vast knowledge of potions and herbs

		Whelp: (n, archaic) a puppy or cub; a boy or young man (often as a disparaging form of address); (v) (of a female dog) give birth to (a puppy)

		Aeolian: relating to or arising from the action of the wind (from Aeolus, the ruler of the winds, which he kept fastened up in a bag)

		Warlock: a man who practices witchcraft. A sorcerer

		Tiresias: a blind prophet of apollo in Thebes, famous for clairvoyance and for being transformed into a woman for seven years

		Erebus: Greek primordial deity, personification of darkness; a region of the underworld where the dead pass immediately after dying, and is sometimes used interchabgeably with Tartarus

		Nyx: Greek goddess (or personification) of the night, mothered Hypnos (sleep) and Thanatos (death) with Erebus. She is a figure of such exceptional power and beauty that she is feared by Zeus himself

		Asphodel: an everlasting flower saidbti grow in the Elysian Fields (afterlife for gods and heroes and their relations); a Eurasian plant of the lily family, typically having ling slender leaves and flowers borne on a spike

		Tantalize: torment or tease (someone) with the sight or promise of something that is unobtainable; excite the senses or desires of (someone) (ety: from tantalus, famous for his eternal punishment in Tartarus for having stolen ambrosia and nectar, who was made to stand chin-deep in a pool of water beneath a fruit tree with low branches, with the fruit ever eluding his grasp and the water receding before he could take a drink)

		Nectar: a sugary fluid secreted within flowers to encourage pollination by insects and other animals, collected by bees to make into honey; (in Greek and Roman mythology) the drink of the gods; a delicious drink

		Between Scylla and Charybdis: having to choose between two evils

		Batten: (n) a long flat strip of squared timber or metal used to hold something in place or as a fastening against a wall; (v) strengthen or fasten (something) with battens; (on) thrive or prosper at the expense of (eg: multinationals batten on the working class)

		Blain: an inflamed swelling or sore on the skin

		Maw: the jaws or thrust of a voracious animal; the mouth or gullet of a greedy person

		Gullet: the passage by which food passes from the mouth to the stomach. The œsophagus

		Low: (as v) (of a cow) make a characteristic deep sound; moo, bellow

		Levin: (archaic) lightning. Thunderbolts

		Alderman: a co-opted member of an English county or borough council, next in status to the mayor; an elected member of a city council

		Godspeed: an expression of good wishes to a person starting a journey

		Forswear: agree to give up or do without; renounce, forgo, abjure, relinquish, shun, abstain, eschew, repudiate, spurn, cease; commit perjury, swear falsely

		Bantling: (archaic) a young child

		Mince: cut up (food, esp. meat) into very small pieces, typically in a machine; walk with short quick steps in an affectedly dainty manner; teeter, waddle; affected, fastidious, dainty, precious, chichi

		Dandle: move (a baby or young child) up and down in a playful or affectionate way; move (something) lightly up and down

		Cavalier: (n) a supporter of King Charles I in the English civil war; a court gentleman, esp. one acting as a lady's escort; a horseman, esp. a calvalryman; a small spaniel of a breed with a king snout; (a) showing a lack of proper concern; offhand, indifferent, insouciant, supercilious

		Offhand: (a) ungraciously or offensively nonchalant or cool in manner; blase, glib, perfunctory, brusque

		Brusque: abrupt or offhand in speech or manner; curt, blunt, terse, brisk, peremptory, gruff, caustic, plain-spoken, tactless, undiplomatic

		Küntslerroman: meaning "artist's novel" is a narrative about an artist's growth to maturity. It may be classified as a specific subgenre of Bildungsroman (coming of age novel)

		Cloaca: a common cavity at the end of the digestive tract for the release of both excretory and genital products in vertebrates (except most mammals) and certain invertebrates; a sewer

		Vamp: (n,v) (attach a new) upper front part of a boot or a shoe; (in jazz or popular music) repeat a short, simple passage of music, typically an introductory one

		Writ large: clear and obvious; in a stark or exaggerated form

		Enthymeme: an argument in which one premise is not explicitly stated

		Brassiere: full form of bra

		Gird (girded, girt): encircle (a person or part of the body) with a belt or band; secure (a garment or sword) on the body with a belt or band; surround. Encircle; enclose, skirt, circumscribe, edge, confine, girdle, compass

		Crane: (as v) stretch out one's body or neck in order to see something; stretch out (one's neck) so as to see something;  move (a heavy object) with a crane

		Gamine: (n,a) a girl with a mischievous, boyish charm

		Cowl: a large loose hood, esp. forming part of a monk's habit; a monk's hooded, sleeveless habit; the hood-shaped covering of a chimney or ventilation shaft; another term for cowling

		Cowling: the removable cover of a vehicle or aircraft engine

		Deuced: (informal, dated) used for emphasis, esp. to express disapproval or frustration

		Smart: (a) (of a person) clean, tidy, and well dressed; (of clothes) attractively neat and stylish; (of an object) bright and fresh in appearance; (of a place) fashionable and upmarket; quick. Brisk; (v) (of a part of the body) feel a sharp stinging pain; tingle, prickle; feel upset or annoyed; (n) sharp stinging pain

		Vestry: a room or building attached to a church, used as an office and for changing into ceremonial vestments; a meeting of parishioners, originally in a vestry, for the conduct of parochial business

		Moiety: each of two parts into which something can be divided; a part or portion, especially a lesser share; a distinct part of a larger molecule

		Sea-wrack: seaweed, esp. cast ashore in masses

		Foreshore: the part of a shore between high and low-water marks, or between the water and cultivated or developed land

		Bale: (n) a large wrapped or bound bundle of paper, hay, or cotton; truss, parcel, bunch; the quantity in a bake as a measure, specifically (in the US) 500 lbs of cotton; (archaic) evil considered S a destructive force; evil suffered. physical or mental torment; (v) make up into bales; scoop water out of (a ship or boat); scoop (water) out of a ship or boat

		Japan: cover (something) with a hard black varnish

		Abiotic: physical rather than biological. Not derived from living organisms; devoid of life. Sterile

		Catafalque: a decorated wooden framework supporting the coffin of a distinguished person during a funeral of while lying in state

		Instate: set up in position. Install or establish

		Pandybat: a stout leather strap reinforced internally with whalebone or even lead and used to inflict punishment; especially by using it to strike against the open uplifted hands of schoolboys

		Slit: (n) a long narrow cut or opening; (v) make a long, narrow cut in; cut (something) into strips; form (one's eyes) into slits. Squint

		Monstrance: (in the Roman Catholic Church) an open or transparent receptacle in which the consecrated host is displayed for veneration

		Hale: (of an old person) strong and healthy

		Morpheme: a meaningful morphological unit of a language that cannot be further divided; a morphological element considered in respect of its functional relations in a linguistic system

		Coda: the concluding passage of a piece or movement, typically forming an addition to the basic structure; the concluding section of a dance, esp. of a pas de deux or the finale of a ballet in which the dancers parade before the audience; a concluding event, remark, or section

		Rouge: a red powder or cream used as a cosmetic for coloring the cheeks or lips; (v) color with rouge

		Laterigrade: having a sideways manner of moving, like a crab

		Forthwith: (esp. in official use) immediately, without delay; posthaste, tout de suite, forthright

		Prehensile: capable of grasping

		Talcum: (n) a cosmetic or toilet preparation consisting of the mineral talc in powdered form, typically perfumed; (v) powder (something) with talcum

		Bonhomie: cheerful friendliness. Geniality; conviviality, affability, amiability, jollity

		Amiable: having or displaying a friendly and pleasant manner

		Valetudinarian: (n,a) a person who is unduly anxious about their health; hypochondriac, valetudinary; a person suffering from poor health (ety: Latin "valere, valetudo, valetudinarius" meaning "be well, health, in ill health)

		Carpus: the eight bones of the human carpus, from the wrist and part of the hand, arranged in two rows

		Streng verboten: German for strictly forbidden

		Dart: (as v) move or run somewhere suddenly or rapidly; cast (a look or one's eyes) suddenly and rapidly in a particular direction; shoot (an animal) with a dart, typically in order to administer a drug

		Reprieve: (v) cancel or postpone the punishment of (someone, esp. someone condemned to death); abandon or postpone plans to close or abolish (something); (n) the cancellation or postponement of a punishment; remission, respite, amnesty, acquittal; a cancellation or postponement of an undesirable event (ety: Latin "re + prehendere" meaning "back + seize", same root as "reprendre"

		Purblind: having impaired or defective vision. Partially blind; slow or unable to understand. Dim-witted

		Shadowgraph: an image formed by the shadow of an object on a surface; an image formed when light shone through a fluid is refracted differently by regions of different density (such as the bottom of a pool or the plume of hot air rising from a fire)

		Lithophane: a kind of ornamentation of porcelain visible when held to the light, produced by pressing designs into it when soft; an object with a lithophane decoration

		Aslant: (adv) at an angle or in a sloping direction; (prep) across (something) at an angle (eg: light fell aslant the door)

		Pendant: (n) a piece of jewelry that hangs from a chain; a light designed to hang from the ceiling; an artistic, literary, or musical composition intended to match or complement another; (a) hanging downwards. Pendent

		Moonfaced: having a round face due to Cushing's syndrome or the accumulation of fat in the sides of the head

		Selenian: of, related to, or designating the moon

		Seleno-: a combining from meaning "moon" used in the formation of compound words, eg: selenography

		Flavid: yellow (ety: Latin "flavus" meaning "yellow"

		Herculanita: heroin (drug)

		Concord: agreement or harmony among people or groups; a treaty; agreement between words in gender, number, case, person, etc.; a chord that is pleasing or satisfactory in itself

		Suture: (n) a stitch or row of stitches holding together the edges of a wound or surgical incision; a seam-like immovable junction between two bones, such as those of the skull; a junction between the sclerites of an insect's body; a line of junction formed by two crustal plates which have collided; (v) stitch up (a wound or incision) with a suture

		Sclerite: a component section of an exoskeleton, esp. each of the plates forming the skeleton of an arthropod

		Logodaedaly: arbitrary or capricious coinage of words

		Logomancy: divination by words

		Undinism: sexual arousal by water, esp. urination. Urolagnia

		Urolagnia: a tendency to derive sexual pleasure for the sight or thought of urination (ety: English "uro" and Latin "lagneia" meaning "of urine" and "lust")

		Styx: a Greek deity and river that forms the boundary between earth and hades (the underworld)

		Settee: (Brit) a long upholstered seat for more than one person, typically with a back and arms; sofa, divan, couch, chaise longue, canapé, davenport

		Vivisection: the practice of performing operations on live animals for the purpose of experimentation or scientific research (used only by opponents of such work); ruthlessly sharp and detailed criticism or analysis

		Dote: be extremely and uncritically fond of; adore, worship, treasure, cherish; (archaic) be silly or feeble minded, esp. as a result of old age

		Cuticle: the dead skin at the base of a fingernail or toenail; the outer cellular layer of a hair; a protective and waxy hard layer covering the epidermis of a plant, invertebrate, or shell; another term for epidermis

		Lunula: a crescent-shaped object or mark; the white are at the base of a fingernail; one of a pair of parentheses

		Galosh: a waterproof overshoe

		Starling: a gregarious old world songbird with a straight bill, typically with dark, lustrous, or iridescent plumage but sometimes brightly colored (imported in America by a man who wanted every bird mentioned by Shakespeare to be in America. Brought 100, now flock in millions); a wooden pile erected with others around or just upstream of a bridge or pier to protect it from the current or floating objects

		Tyro: a beginner or novice

		Syncope: temporary loss of consciousness caused by a fall in blood pressure; the omission of sounds or letters from within a word, for example when "library" is pronounced "libry"

		Boschian: relating to Hieronymus Bosch (1450-1516) Dutch painter known for his fantastic apocalyptic paintings, featuring half-men or animals, upside down houses, etc.

		Telltale: (a) revealing, indicating, or betraying something; (n) (Brit) a person, esp. a child, who reports others' wrongdoings or reveals their secrets; tattletale, blabber mouth, snitch; a device or object that automatically gives a visual indication of the state or presence of something

		Hirsute: (humorous) hairy; shaggy, wooly, furry, fleecy, unshorn, bewhiskered, crinigerous, crinite

		Crinite: having hair-like tufts. Hairy

		Musk: a strong-smelling reddish-brown substance which is secreted by the male musk deer for scent marking and is an important ingredient in perfumery

		Ewe: a female sheep

		Libation: a drink poured out as an offering to a deity; the pouring out of a libation; (humorous) a drink

		Aurora: the dawn; northern lights (aurora borealis/australis)

		Spoor: (n) the track of scent of an animal; (v) follow the track or scent of (an animal or person)

		Loath: reluctant, unwilling

		Lucre: money, especially when regarded as sordid or distasteful or gained in a dishonorable way ("filthy lucre," biblical allusion

		Mythopoeia: narrative genre in modern literature and film where a fictional or artificial mythology is created by the writer

		Instep: the part of a person's foot between the ball and the ankle; the part of a shoe which fits over or under the instep; a thing shaped like the inner arch of the foot

		Bangle: a rigid ornamental band worn round the arm or occasionally the ankle

		Limpid: (of a liquid) completely clear and transparent; crystalline, pellucid; (of a person's eyes) unclouded. Clear; (esp. of writing or music) clear and accessible or melodious

		Hassock: a cushion for kneeling on in church, while at prayer; a footstool; a firm clump of grass or matted vegetation in marshy or boggy ground

		Truculent: eager or quick to argue or fight. Aggressively defiant; belligerent, pugnacious, bellicose, confrontational, quarrelsome, contentious

		Caloricity: physiological ability to develop and maintain bodily heat

		Forsythia: an ornamental Eurasian shrub whose bright yellow flowers appear in early spring before the leaves

		Ken: one's range of knowledge or understanding (eg: beyond my ken)

		Bole: the trunk of a tree; a fine, smooth, reddish clay containing iron oxide, used esp. as a ground for oil painting and gilding

		Vernal: of, in, or appropriate to spring

		Harlot: a prostitute or promiscuous woman

		Hangnail: a piece of torn skin at the root of a fingernail

		Dropsical: affected with or characteristic of dropsy (old fashioned, less technical term for edema). Edematous

		Edema: a condition characterized by an excess of watery fluid collecting in the cavities or tissues of the body

		Catalpa: a tree with large heart-shaped leaves, clusters of trumpet shaped flowers, and slender bean like seed pods, native to North America and Eastern Asia and cultivated as an ornamental

		Inutile: useless

		Prissy: fussily and excessively respectable; prudish, priggish, prim, proper, stuffy, mimsy, Victorian, schoolmarmish, grundyish, square toed

		Jovian: (a) of or like the god Jove (Jupiter); relating to the planet Jupiter or the class of giant planets to which Jupiter belongs; (n) a hypothetical or fictional inhabitant of Jupiter

		Sleuth: (informal) (n) a detective; (v) carry out a search or investigation in the manner of a detective

		Flatus: gas in or from the stomach or intestines, produced by swallowing air or by bacterial fermentation

		Cryptochome: flavoproteins found in plants or animals, sensitive to blue light, and involved in the circadian rhythms and in the sensing of magnetic fields

		Pate: (archaic, humorous) a person's head

		Mimeograph: ancestor of the photocopier, produces copies from a stencil

		Tincture: (n) a medicine made by dissolving a drug in alcohol; (Brit) an alcoholic drink; a slight trace of something; note, tinge, dash, hint, scintilla, streak, vein, whiff, whisper; any of the conventional colors (including the metals and stains, and often the furs) used in coats of arms; (v) be tinged or imbued with a slight amount of

		Barouche: a four wheeled horse drawn carriage with a collapsible hood over the rear half, a seat in front for the driver, and sears facing each other for the passengers

		Palisade: (n) a fence of wooden stakes or iron railings fixed in the ground, forming an enclosure or defense; paling, bulwark, stockade; a strong pointed wooden stake fixed in the ground with others in a close row, used as a defense; a line of high cliffs; a ridge of high basalt cliffs that line the western side of the Hudson River, in New Jersey and in New York; (v) enclose or provide (a building or place) with a palisade

		Sturm und Drang: (literally "storm and drive/urge" but usually translated as "storm and stress") a proto-Romantic movement in German literature and music that took place from the late 1760s to the early 1780s in which individual subjectivity and, in particular, extremes of emotion were given free expression in reaction to the perceived constraints of rationalism imposed by the enlightenment (after Friedrich Maximilian Klinger's play Sturm uns Drang

		Penance: punishment inflicted on oneself as an outward expression of repentance for wrongdoing; expiation, self-mortification, atonement; a sacrament in which a member of the Church confesses sins to a priest and is given absolution; a religious observance or other duty required of a person by a priest as part of this sacrament to indicate repentance

		Complaisant: willing to please others or to accept what they do or say without protest; amenable, agreeable, acquiescent, pliant, obliging, deferential

		Brunt: the worst part or chief impact of a specified situation; stress, thrust, impact

		Halloo: (exclamation, v) used to incite dogs to the chase during a hunt; used to attract someone's attention; (n) a cry of "halloo"; yell, bawl, bellow, shriek, screech, whoop, roar, holler

		Wonted: habitual, usual

		Bailiff: (Brit) a sheriff's officer who executed writs and processes and carries out distraints or arrests; the agent of a landlord; (US) an official in a court of law who keeps order, looks after prisoners, etc.; (Brit, historical) the sovereign's representative in a district, especially the chief officer of a hundred

		Supernumerary: (a) present in excess of the normal or requisite number, in particular: (of a person) not belonging to a regular staff but engaged for extra work; not wanted or needed. Redundant; (of an actor) appearing on stage but not speaking; denoting a structure or organ occurring in addition to the normal ones; (n) a supernumerary person or thing

		Teat: nice word for tit; (Brit) a thing resembling a teat or nipple, especially a perforated plastic bulb by which an infant or young animal can suck milk from a bottle

		Latterly: recently. Lately; in the later stages of something, esp. of a person's life

		Descry: catch sight of

		By the by/bye: incidentally

		Coze: (v,n) chat, converse in a friendly way

		Dint: (n) a dent or hollow in a surface; indentation, dip, dimple, cleft, hollow, crater, pit, gouge, gash; (archaic) a blow or stroke, typically one made with a weapon in fighting; force of attack. Impact (eg: I perceive you feel te dint of pity); (v) mark (a surface) with dents or hollows

		Ha-ha: a ditch with a walk on its inner side below ground level, forming a boundary to a park or garden without interrupting the view (ety: said to be from the cry of surprise in suddenly encountering such an obstacle)

		Tallow: (n) a hard fatty substance made from rendered animal fat, used (especially formerly) in making candles and soap; (v) smear (something, esp. the bottom of a boat) with tallow

		Poultice: (n) a soft, moist mass of material, typically consisting of bran, flour, herbs, etc., applied to the body to relieve soreness and inflammation and kept in place with a cloth; (v) apply a poultice to

		Indwell: be permanently present in (someone's soul or mind); possess spirituality; (of a catheter, needle, etc.) fixed in a person's body for a sustained period of time

		Ad nauseam: used to refer to the fact that something has been done or repeated so often that it has become annoying or tiresome

		Aoriste: (a,n) relating to or denoting a past tense of a verb (especially in Greek)  which does not contain any reference to duration or completion of the action

		Diathesis: a tendency to suffer from a particular medical condition; the set of syntactic patterns with which a verb or other word is most typically associated

		Usufruct: the right to enjoy the use and advantages of another's property short of the destruction or waste of its substance; (ety: Latin "usus et fructus" meaning "use and enjoyment")

		Usufructuary: having the usufruct of property

		Anagnorisis: a moment in a plot or story, specifically a tragedy where the main character recognizes or identifies his/her true nature, that of another character, or that of the situation, leading to the resolution of the story

		Peripeteia: a sudden reversal of fortune or change in circumstances, especially in reference to fictional narrative

		Coalesce: come together to form one mass or whole; unite, merge, fuse, combine, mingle, meld, amalgamate, converge, commingle; combine (elements) into a mass or whole

		Commingle: mix, blend

		Metonymy: the substitution of the name of an attribute or adjunct for that of the thing meant, for example "the turf" for "horse racing" (ety: Greek meaning "change of name"

		Whirligig: a toy that spins round, for example a top or windmill; a merry-go-round; a process or activity characterized by constant change or hectic activity; a small black predatory beetle which swims rapidly in circles on the surface of still or slow-moving water and dives when alarmed

		Edulcorate: make (something) more acceptable or palatable (ety: Latin "ex + dulcor" meaning "out + sweetness")

		Spic and span: neat, clean, and well looked after

		Viatic: of or relating to traveling, a road, or a way

		Priapic: relating to or resembling a phallus; relating to male sexuality and sexual activity; (of a man) having a persistently erect penis

		Silver: (as v) coat or plate with silver; provide (mirror glass) with a backing of a silver colored material in order to make it reflective; (esp. of the moon) give a silvery appearance to; turn (a person's hair) grey or white; (of a person's hair) turn grey or white

		Jeer: (v,n) a rude and mocking remark; taunt, sneer, jibe, catcall, heckle, hector, scorn

		Shirr: gather (an area of fabric or part of a garment) by means of drawn or elasticized threads in parallel rows; bake (an egg) without its shell

		Parsimonious: very unwilling to spend money or use resources; niggardly, frugal, sparing, Scrooge-like

		Pavonine: of or like a peacock

		Ocellus: another term for eye; another term for eyespot

		Skirt: (as v) go round or past the edge of; circumnavigate; be situated along the edge of; go along or around (something) rather than directly across it; attempt to ignore. Avoid dealing with; circumvent, bypass, sidestep, evade, fight shy of

		Areola: a small circular area, in particular the ring of pigmented skin surrounding a  nipple; any of the small spaces between lines or cracks on a leaf or an insect's wing; a reddened patch around a spot or papule

		Umber: a natural pigment resembling but darker than ochre, normally dark yellowish-brown in color (raw umber) or dark brown when roasted (burnt umber); either of the colors of umber; a brownish moth with a coloring that resembles tree bark

		Leporine: of or resembling a hare or hares

		Rill: a small stream; a shallow channel cut in the surface of soil or rocks by running water; varient spelling of rille

		Rille: a fissure or narrow channel on the moon's surface

		Fain: (archaic) (a) pleased or willing under the circumstances; compelled by the circumstances. Obliged; (adv) gladly

		Crepitate: make a crackling sound

		Talus: the large bone in the ankle, which articulates with the tibia of the leg and the calcaneus and navicular bone of the foot; a sloping mass of rock fragments at the foot of a cliff; the sloping side of an earthwork, or of a wall that tapers to the top

		Pace: (n) a single step taken when walking or running; a unit of length representing the distance between two consecutive steps in walking; a gait of a horse or other animal, esp. one of the recognized trained gaits; a person's manner of walking or running; gait, stride, tread; speed in walking, running, or moving; (v) walk at a steady speed, especially without a particular destination and as an expression of anxiety or annoyance; (out) measure (a distance) by walking it and counting the number of steps taken; (of a trained horse) move in a distinctive lateral gait in which both legs on the same side are lifted together; move or develop (something) at a particular rate or speed; lead (another runner in a race) in order to establish a competitive speed; (oneself) do something at a slow and steady rate in order to avoid overexertion

		Cringe: (v,n) bend one's head and body in fear or apprehension or in a servile manner; cower, shrink, flinch, blanch, duck, crouch, quail, kowtow, grovel, fawn, truckle; experience an inward shiver of embarrassment or disgust

		Nifty: (informal) particularly good, skillful, or effective; attractive or stylish

		Neckerchief: a square of cloth worn round the neck

		Entreaty: an earnest or humble request; plea, solicitation, supplication, obsecration, impetration, cri de cœur

		Fritter: waste time, money, or energy on trifling matters; squander, be prodigal with, dissipate; divide (something) into small pieces

		Smack: (n) a sharp slap or blow, typically one given with the palm of the hand; clout, cuff, swat, thwack, crack; a loud, sharp sound; bang, crash, thud, thump; a loud kiss; (v) strike (someone or something) typically with the palm of the hand and as punishment; smash, drive, or put forcefully into or on to something; part (one's lips) noisily in eager anticipation or enjoyment of food or drink; (adv, informal) in a sudden and violent way; straight, right, squarely, headlong

		Squarely: directly, without deviating to one side; in a direct and uncompromising manner

		Rhotic: relating to or denoting a dialect or variety of English in which 'r' is pronounced before a consonant (as in hard) and at the ends of words (as in far)

		Assent: (v,n) express approval or agreement; (n) official agreement or sanction

		Wellington: a knee-length waterproof rubber or plastic boot

		Burgher: (archaic, humorous) a citizen of a town or city, typically a member of the wealthy bourgeoisie; (in Southern Africa) an Afrikaans citizen of a Boer republic, or a civilian member of a local militia unit; a descendent of a Dutch or Portuguese colonist in Sri Lanka

		Titivate: (v) make minor enhancements to; groom, arrange, preen, primp, plume, trig, brush; make oneself look smart

		Primp: spend time making minor adjustments to (one's hair, makeup, or clothes); spruce up, smarten (up); titivate

		Stir: (v) move a spoon or other implement round and round in (a liquid or other substance) in order to mix it thoroughly; mix an ingredient into (a liquid or other substance) by moving a spoon or other implement round and round; move or cause to move slightly; twitch, change position, agitate, swish, flutter, rustle; rise or wake from sleep; rouse oneself, arise, rise, surface; leave or go out of (a place); begin or cause to begin to be active or to develop; arouse strong feeling in (someone). Move or excite; arouse, stimulate, galvanize, whet, enkindle; arouse or prompt (a feeling or memory) or inspire (the imagination); (n) a slight physical movement; an initial sign of a specified feeling; a commotion; fuss, ado, uproar, ferment, brouhaha, furore, turmoil, an act of stirring food or drink

		Ferment: (v) (of a substance) undergo fermentation; effervesce, brew; cause the fermentation of (substance); incite or stir up (trouble or disorder); spawn, engender, arouse, foment, kindle, beget, enkindle; (n) agitation and excitement among a group of people, typically concerning major change and leading to trouble or violence; frenzy, tumult, bustle, hubbub, stew, ruckus, clamor, unrest, upheaval, turbulence, mayhem, hurly-burly, chaos; a fermenting agent or enzyme

		Rouse: cause to stop sleeping; cease to sleep or to be inactive; startle (game) from a lair or cover; make angry or excited; give rise to (an emotion or feeling); stir (a liquid, esp. beer while brewing)

		Pique: (n) a feeling of irritation or resentment resulting from a slight, esp. to one's pride; (v) arouse (interest or curiosity); feel irritated or resentful; gall, irk, nettle, disgruntle, ruffle; (archaic) pride oneself

		Whet: (v) sharpen the blade of (a tool or weapon); hone, edge, acuminate; excite or stimulate (someone's desire, interest, or appetite; fuel, fire, incite, titillate, galvanize, trigger, rouse, arouse, stir; (n, archaic) a thing that stimulates appetite or desire

		Sibylline: relating to or characteristic of a sibyl. Prophetic and mysterious

		Sibyl: a woman in ancient times who was thought to utter the prophecies of a god; a woman able to foretell the future

		Jouissance: physical or intellectual pleasure, delight, or ecstasy

		Jag: (n) a sharp projection (adj: jagged); a bout of unrestrained or excessive indulgence in alcohol or drugs, or in a particular emotion or activity (e.g.: crying jag); (v) stab, pierce, or prick

		Abreast: side by side and facing the same way; abeam, cheek by jowl, shoulder to shoulder; (of, nil) alongside or level with something; (of, nil) up to date with the latest news, ideas, or information

		Abeam: on a line at right angles to a ship's or an aircraft's length; directly abreast the middle of a ship's side

		Typography: the style and appearance of printed matter; the art or procedure of arranging type or processing data and printing from it

		Hobble: (v) walk in an awkward way, typically because of pain from an injury; limp, dodder, shamble, stumble, stagger, reel, hirple; cause (a person or animal) to limp; tie or strap together (the legs of a horse or other animal) to prevent it from straying (n: the string or rope used); restrict the activity or development of; (n) an awkward way of walking, typically due to pain from an injury

		Shamble: (v,n) (of a person) move with a slow, shuffling, awkward gait; limp, lumber, scuff one's feet

		Scuff: (v) scrape or brush the surface of (a shoe or other object) against something; scrape, rub, drag, brush, scratch, graze, abrade, rasp, lacerate, chafe; mark (a surface), or become marked by scraping or brushing, especially with one's shoes; drag (one's feet or heels) when walking; walk while dragging one's feet; (n) a mark made by scraping or grazing the surface of an object

		Reel: (n) a cylinder on which film, wire, thread, or other flexible materials can be wound; a length of something wound on to a reel; a part of a film; a device for winding and unwinding a line as required, in particular the line attached to a fishing rod; a lively Scottish or Irish folk dance; a piece of music for a reel, typically in simple or duple time; (v) wind something on to a reel by turning the reel; bring in a fish by winding in the line; lose one's balance and stagger or lurch violently; falter, stumble, pitch, roll; walk in a staggering manner, especially while drunk; feel shocked, bewildered, or giddy; be dumbfounded/dumbstruck at, be aghast by, be bowled over by, be dazed/staggered/upset by; dance a reel

		Lithe: (especially of a person's body) thin, supple, and graceful; agile, limber, nimble, deft, spry, pliant, lissom, willowy

		Nimble: quick and light in movement or action, agile; lithe, sprightly, light-footed,  spry, active, adroit, fleet; (of the mind) able to think and understand quickly; shrewd, perspicacious, astute, clever, brilliant, perceptive, penetrating, discerning

		Willowy: bordered, shaded, or covered by willows; (of a person) tall, slim, and lithe; slender, lean, svelte, lissom, sylphlike, clean-limbed, graceful, gracile, attenuate

		Sylphlike: (of a woman or girl) slender and graceful

		Sylph: an imaginary spirit of the air; a slender woman or girl; a mainly dark green and blue hummingbird, the male of which has a long forked tail

		Svelte: (of a person) slender and elegant

		Attenuate: (v) reduce the force, effect, or value of; reduce in thickness, make thin; (a) reduced in force, effect, or physical thickness

		Gracile: (of a hominid species) of slender build; (of a person) attractively slender or thin

		Lissom: (of a person or their body) thin, supple, and graceful; lithe, sylphlike, sleek, trim, dexterous

		Limber: (of a person or body part) lithe or supple; flexible; te detachable front part of a gun carriage, consisting of two wheels and an axle, a pole, and a frame holding one or more ammunition boxes  (v) warm up in preparation for excercise or activity; attach a limber to (a gun)

		Eke (out): (v) make an amount or supply of something last longer by using or consuming it frugally; scrimp and scrape, save, be thrifty with, be frugal with, be sparing with, budget, husband; manage to make (a living) with difficulty; (adv) archaic term for also

		Bristle: (n) a short stiff hair on an animal's skin or a man's face; whisker, stubble; a stiff animal hair or a man name substitute, used to make a brush; (v) (of hair or fur) stand upright away from the skin, typically as a sign of anger or fear; stand on end, horripilate (of an animal) react in such a way that it's hair or fur stands on end; (of a person) react angrily or defensively; bridle, take umbrage, become infuriated, flare up, draw oneself up, get/have one's hackles up, feel one's hackles rise, rear up; be covered with or abundant in; abound, swarm, teem, crawl, overflow, hum, be thronged, be thick

		Hackle: (n) erectile hairs along an animal's back, which rose when it is angry or alarmed; a long, narrow feather on the neck or saddle of a domestic cock or other bird; a feather wound around a fishing fly so that it's filaments are splayed out; fly fishing feathers collectively; a bunch of feathers in a military headdress, for example of a regiment of fusiliers or the black watch; (v) dress or comb (flax) with a hackle

		Bridle: (n) a harness consisting of a headstall, bit, and reins, fitted about a horse's head and used to restrain or guide the animal; a curb or check; a span of chain, wire, or rope that can be secured at both ends to an object and slung from its center point; (v) to put a bridle on; to control or restrain; to lift the head and draw in the chin in anger or resentment; to be angry or resentful, take offense

		Jingoistic: characterized by extreme patriotism, especially in the form of agressive or warlike foreign policy

		Untrammeled; not deprived of freedom of action or expression; not restricted or hampered

		Trammel: (n) restrictions or impediments to freedom of action; a three-layered dragnet, designed so that a fish entering through one of the large-meshed outer sections will push part of the finer-meshed central section through the large meshes on the further side, forming a pocket in which the fish is trapped; an instrument consisting of a board with two grooves intersecting at right angles, in which the two ends of a beam compass can slide to draw an ellipse; a beam compass; a hook in a fireplace for a kettle; (v) deprive of freedom of action; curb, confine, hamper, thwart, frustrate, impede, forestall, hamstring, ensnare, enmesh, bridle, retard, hinder, obscure

		Mire: (n) a stretch of swampy or boggy ground; soft mud or dirt; a wetland area or ecosystem based on peat; a complicated or unpleasant situation from which it is difficult to extricate oneself; (v) cause to become stuck in mud; cover or splatter with mud; soil, begrime, smear; involve someone or something in (a difficult situation)

		Callous: (a) showing or having an insensitive and cruel disregard for others; heartless, cold-hearted, stony-hearted, hardened, harsh, ruthless, unsympathetic, uncharitable, bloodless, soulless, marble-hearted, indurate; (n) varant spelling of callus (thickened and hardened part of the skin)

		Indurate: (v,a) physically or morally hardened; (etymology: Latin durare: to harden; to endure, like obdurate, endurance, durable, during, etc...)

		Callow: (of a young person) inexperienced and immature; naive, green, untried, raw, unseasoned, juvenile, jejune, innocent, artless, unworldly

		Artless: lacking art, knowledge, or skill; made without skill; free from artificiality; free from guile or craft

		Agape: (a) (of a person's mouth) wide open in surprise or wonder; (n) (pronounced agapee) Christian love as distinct from erotic love or simple affection; a communal meal heldbin christian fellowship

		Hark: listen; (at someone) used to draw attention to someone who has said or done something considered to be foolish or silly

		Cornucopia: (horn of plenty) a symbol of plenty consisting of a goat's horn overflowing with flowers, fruit, and corn; an ornamental container shaped like a goat's horn; an abundant supply of good things of a specified kind

		Kummerspeck: excess weight gained due to emotional overeating

		Wherewithal: the money or other means needed for a particular purpose

		Solipsism: the view or theory that the self is all that can be known to exist; the quality of being self-centered or selfish

		Solescism: a grammatical mistake in speech or writing; lapsus linguae (lit: slip of the tongue), lapsus calumi (slip of the pen), cacology; a breach of good manners, an instance of incorrect behavior; faux pas, gaffe, breach of etiquette, impropriety, piece of indecorum, infelicity, lapse, gaucherie

		Cacology: a bad choice of words, faulty speech; bad diction or pronunciation

		Gaucherie: a tactless or awkward act

		Straw man: an intentionally misrepresented proposition that is set up because it is easier to defeat than an opponent's real argument; a person regarded as having no substance or integrity

		Bumble: move or act in an awkward or confused manner; shamble, stagger, totter, teeter, reel, muddle, flounder, falter; (bumbling) clumsy, maladroit, gauche, muddled; speak in a confused or indistinct way; ramble, babble, burble, drivel, gibber, blather, mumble, mutter; (of an insect) buzz or hum

		Shill: (n) an accomplice of a confidence trickster or swindler who poses as a genuine customer to entice or encourage others; a person who pretends to give an impartial endorsement of something in which they themselves have an interest; (v) act or work as a shill

		Calliope: an American keyboard instrument resembling an organ but with the notes produced by steam whistles, formerly used o showboats and in traveling fairs; (Greek mythology) the muse who presides over eloquence and epic poetry, so called from the ecstatic harmony of her voice

		Tarry: (v) stay longer than intended, delay leaving a place; linger, loiter, procrastinate, dawdle

		Recrudesce: break out again, recur

		Buoy: (n) an anchored float serving as a navigation mark, to show reefs or other hazards, or for mooring; (v) (up) keep (someone or something) afloat; cause to become cheerful or confident; cheer, hearten, uplift, inspirit, stimulate, perk up; cause (a price) to rise to or remain at a high level; (nil) mark with a buoy

		Pauper: a very poor person; indigent, down-and-out; a recipient of government relief or public charity (etymology: Latin legal phrase "in forma pauperis" lit. "in the form of a poor person" allowing nonpayment of costs)

		Uxorious: having or showing an excessive or submissive fondness for one's wife (etymology: Latin 'uxor' meaning 'wife')

		Fastness: a secure refuge, especially a place well protected by natural features; the ability of a material or dye to maintain its color without fading or washing away

		Mettle: a person's ability to cope well with difficulties or to face a demanding situation in a spirited and resilient way; fortitude, strength of character, grit, true grit, valor, daring (ety: specialized spelling of metal)

		Copacetic: (informal) in excellent order

		Prevaricate: speak or act in an evasive way

		Ossianic: of, relating to, or resembling the legendary Irish bard Ossian, the poems ascribed to him, or the rhythmic prose style used by James macpherson in the poems he claimed to have translated from Ossian

		Mesmerize: capture the complete attention of (someone); transfix; hypnotize (someone) enthral, spellbind, entrance, dazzle, grip, enrapture

		Beguile: charm or enchant (someone), often in a deceptive way; woo, inveigle, ensnare, lure, dupe, hoodwink, diddle; trick (someone) into doing something; help (time) pass pleasantly; absorb, occupy, waste, pass, fritter

		Enfilade: (ev,n) a volley of gunfire directed along the line from end to end; (n) a suite of rooms with doorways in line with each other

		Strafe: (v,n) attack repeatedly with bombs or machine-gun fire from low-flying aircraft (etymology: humorous adaptation of the German First World War catchphrase "gott strafe England" meaning "may god punish England")

		Hare: (n) a fast-running mammal that resembles a rabbit, having very long legs and typically found in grassland or open woodland; a dummy hare propelled around the track in greyhound racing; (v) run with great speed

		Scud: (v) move fast in a straight line because of as if driven by the wind; sail, streak, shoot, sweep, whoosh, whizz, buzz, whip, flash, career, skite, scurry, wing; (n) a mass of vapory clouds or spray driven fast by the wind; a driving shower of rain or snow, a gust; the action of moving fast in a straight line when driven by the wind; a type of long-range surface to surface missile able to be fired from a mobile launcher

		Scutter: (v) (especially of a small animal) move hurriedly with short steps); (n) an act or sound of scuttering

		Mulct: (v) extract money from (someone) by fine or taxation; take money or possessions from (someone) by fraudulent means; (n) a fine or compulsory payment

		Clamor: (n, v) a loud and confused noise, especially that of people shouting; din, racket, tumult, babel, commotion, hubbub, bedlam

		Babel: a confused noise made by a number of voices; a confused situation

		Mellifluous: (of a sound) pleasingly smooth and musical to hear; lyric, harmonious, euphonious, tuneful, musical, dulcet

		Coddle: treat (someone) in an indulgent or overprotective way; pamper, spoil, indulge, humor, pander to, spoon-feed; cook (an egg) in water below boiling point

		Poignant: evoking a keen sense of sadness or regret; touching, affecting, pitiable, pathetic, distressing, heart-rending; sharp or pungent in taste or smell

		Vaunt: (v) boast about or praise (something), especially excessively; brag about, gloat over, parade, revere, extol, laud; (n) a boast

		Contentious: causing or likely to cause an argument, controversial; involving heated argument; vehement, fierce, impassioned; (of a person) given to provoking argument

		Writ: written command in the name of the court or other legal authority; one's power to enforce compliance, submission, one's authority

		Hush: (n, v) silence

		Perfidy: deceitfulness, untrustworthyness; duplicity, disloyalty, double-dealing

		Elegiac: (especially of a work of art) having a mournful quality (eulogy); poignant, dolorous, dirgelike, valedictory; wistfully mournful; verses in elegiac meter (dactylic hexameter followed by dactylic pentameter)

		Cavort: jump or dance around excitedly;  rump, jig, prance, gamble, lark, frolic, gambol, leap, rollick, roughhouse; apply oneself enthusiastically to sexual or disreputable pursuits

		Lurch: (n) an abrupt, uncontrolled movement, especially an unsteady roll or tilt; (v) make such movement or a series of such; stagger, reel, sway, totter, blunder, wobble

		Clout: (informal) (n,v) a heavy blow with the hand or hard object; a piece of clothing, especially one used as a patch (n) influence or power, especially in politics or business;

		Gusto: enjoyment or vigor in doing something; zest, appetite, zeal, verve, glee, fervor; style of artistic execution

		Resplendent: sumptuous, splendid, dazzling

		Stint: (v) supply an un generous or inadequate amount (of something); (n) a person's fixed or allotted period of work; spell, shift, term; limitation of supply or effort

		Creep: (v) (of an unwanted and negative characteristic or fact) occur and develop gradually and almost imperceptibly; (of a thing) move very slowly at an inexorably steady pace; (of a plant) grow along the ground or other surface by means of extending stems or branches; (v,n) (of a plastic solid) undergo gradual deformation under stress; move slowly and carefully, especially in order to avoid being heard or noticed; tiptoe, skulk, steal, sneak, sidle, prowl, pad, edge, inch; (n) the tendency of a car with automatic transmission to move when in gear without the acceleration being pressed; (soil) the gradual downward movement of soil or disintegrated rock due to gravitational forces; gradual bulging of the floor of a mine due to pressure on the pillars

		Epicure: a person who takes particular pleasure in fine food and drink

		Watershed: an area or ridge of land that separates waters flowing to different rivers, basins, or seas; divide; an event or period marking a turning point in a course of action or state of affairs

		Skittish: (of an animal, especially a horse) excitable or easily scared; (of a person) playfully frivolous or unpredictable; skittery, restive, jittery, high-strung

		Moor: (n) a tract of open uncultivated upland; a heath; moorland; a tract of open land preserved for shooting; (v) make fast (a boat) by attaching it by cable or rope to the shore or an anchor; (of a boat) be made fast by mooring

		Protean: tending or able to change frequently or easily; variable, kaleidoscopic, unsettled, shifting, fluid, wavering, mercurial, volatile, labile; able to do many different things, versatile; from proteus, God of "elusive sea change," who homer called the "old man of the sea"

		Veer: (n, v) change direction suddenly; swerve, sheer, career, weave

		Blitz: (n) an intensive or sudden military attack; onslaught, blitzkrieg; a sudden, energetic, and concerted effort, typically on a specific task; (v) attack or damage (a place or building) in a blitz

		Concerted: jointly arranged, planned, or carried out; strenuously carried out; done with great effort

		Gouge: (n) chisel with a concave blade; an indentation or groove made by gouging; (v) (out) make (a groove, hole, or indentation,) as if with a gouge; overcharge, swindle

		Groove: (n) a long, narrow cut or depression, especially one made to guide motion or receive a corresponding ridge; furrow, trench, gouge, gutter, rut, rabbet; an established routine or habit; (v) make a groove or grooves in

		Primordial: existing at or from the beginning of time; primeval; prehistoric, antediluvian; (esp. of a state or quality) basic and fundamental; visceral

		Visceral: relating to deep inward feelings rather than intellect (viscera: internal organs in the main cavities of the body

		Bob: (v, n) (of a thing) make a quick, shirt movement up and down; bounce, jounce, jolt, jerk, wag, waggle, nod

		Feint: (v, n) a deceptive or pretended blow, thrust, or other mvt, esp. in boxing or fencing

		Midriff: the region of the front of the body between the chest and the waist; abdomen

		Desultory: lacking a plan, purpose, or enthusiasm; cursory, perfunctory, lukewarm, aimless, erratic, chaotic, intermittent, sporadic, fitful; (of conversation or speech) going constantly from one subject to another in a halfhearted way, unfocused; occurring randomly or occasionally; (16th century) skipping around

		Erratic: not even or regular in pattern or movement; unpredictable, fitful, mercurial

		Eclectic: deriving ideas, style, or taste from a broad and diverse range of sources; multifaceted, multifarious; denoting or belonging to an ancient class of philosophers not belonging to any recognized school of thought

		Dispense: distribute or provide (a service, act, or information) to a person or number of people; (with) manage without; get rid of; forgo, waive, eschew

		Disband: (of an organized group) break up or cause to break up and stop functioning; disperse, scatter, dissolve

		Sporadic: occurring at irregular intervals or only in a few places; scattered or isolated; patchy, spasmodic, fitful, desultory

		Sullen: bad tempered and sulky; gloomy; morose, farouche, glum, grumpy; (of the sky) full of dark clouds

		Peremptory: (especially of a person's manners or actions) insisting on immediate attention or obedience, esp. in a brusquely imperious way; dictatorial, overweening, magisterial, lordly, bossy; (law) not open to appeal or challenge; final, incontrovertible, irrefutable, categorical, definitive

		Imperious: assuming power or authority without justification; arrogant and domineering

		Burnish: (v) polish something (esp. metal) by rubbing; enhance or perfect (something such as a reputation or a skill; (n) the shine on a highly polished surface

		Perfunctory: (of an action or gesture) carried out with a minimum of effort or reflection; cursory, rushed, fleeting, token, halfhearted, offhand

		Funicular: (a,n) (of a railroad, especially one on a mountainside) operating by cable with ascending and descending cars, counterbalanced; of or relating to a rope or its tension (think funambulist)

		Posthaste: with great speed or immediacy; promptly, quickly, without further ado

		Puckish: playful, especially in a mischievous way; impish, roguish

		Odalisque: female servant in a Turkish harem

		Discomfit: make (someone) feel uneasy or embarrassed; abash, ruffle, fluster, chagrin, mortify, unsettle, discomfort, upset, disorient; discombobulate

		Discombobulate: disconcert or confuse

		Pandiculation: a stretching and stiffening esp. of the trunk and extremities (as when fatigued or drowsy or waking up from sleep)

		Thaumaturge: a worker of wonders and performer of miracles; a magician

		Favonian: of or relating to the west wind; mild or favorable

		Sizzle: (v,n) make a hissing sound when frying or cooking; be very exciting or passionate, especially sexually (the state thereof) torrid, ardent

		Devious: showing a skillful use of underhanded tactics to achieve goals, cunning, conniving, sly, unscrupulous; (of a route or journey) longer and less direct than the most straightforward way; meandering, winding, tortuous

		Exalt: think or speak very highly of; deify, extol, idolize, lionize, acclaim, revere; raise to a higher rank or position; elevate, promote, ennoble, aggrandize; make noble in character, dignify

		Exact: (v) demand and obtain (something) from someone; squeeze, constrain, wring, wrest; inflict (revenge) on someone

		Shoal: (v,n) large number of fish swimming together

		Grim: very serious or gloomy; stern, forbidding, dour; (esp. of a place) unattractive or forbidding; bleak, dreary, sombre, drab

		Hermetic: (of a seal or closure) complete and airtight; insulated or protected from outside influence; relating to an ancient occult tradition encompassing alchemy, astrology, and theosophy; difficult to understand because intended for a small number of people with specialized knowledge

		Fret: (v,n) be constantly and visibly anxious; (v) cause anxiety to; gradually wear away (something) by rubbing or gnawing; flow or move in small waves; (n) a repeating ornamental design of vertical and horizontal lines, such as the Greek key pattern; a mist coming in off the sea; a sea fog (v,n) provide a stringed instrument with a sequence of ridges on the fingerboard

		Heraldry: the system by which coats of arms and other armorial bearings are devised, described, and regulated; armorial bearings or other heraldic cymbals

		Unscathed: without suffering any injury, damage, or harm

		Scorch: (v) burn the surface of (something) with flame or heat; sear, singe, char, torrefy; become burnt when exposed to heat or a flame; dessicate, parch, wither, shrivel; (of the heat of the sun) cause (vegetation or a place) to become dried out and lifeless; (of a person or vehicle) move very fast; (n) the burning or charring of the surface of something; a form of plant necrosis, typically of fungal origin, marked by browning of leaf margins

		Barren: (of land) too poor to produce much or any vegetation; infertile, not producing fruit or seed; showing no results or achievement; (of a place or building) bleak and lifeless; (of) devoid of

		Gush: (v,n) (of a liquid) flow out of something in a rapid and plentiful steam; surge, spout, spurt, stream, Rush, pour, cascade, well out, disembogue; discharge (liquid) in a rapid and plentiful stream; speak or write effusively or with exaggerated enthusiasm; wax lyrical, rave, rhapsodize

		Squeal: (n) a long, high-pitched cry or noise; (v) make a squeal; say something in a high pitched, excited tone

		Welt: (n) a red raised mark or scar, a weal; a leather rim seen round the edge of a shoe upper to which the sole is attached; a ribbed, reinforced, or decorative border of a garment or pocket; a heavy blow; (v) develop a raised scar or weal; strike hard and heavily; provide with a welt

		Biennial: every other year

		Floorboard: long plank part of a wooden floor

		Creak: (of a typically wooden object) make a scraping or squeaking sound when being moved or when pressure is applied; squeak, squeal, complain; show weakness or frailty under strain; (n) a creaking sound

		Creek: a narrow, sheltered waterway, especially an inlet in a shoreline or channel in a marsh; inlet, estuary, bay, bight, fjord, gulf, firth, frith, voe, ria, fleet, armlet; a stream or minor tributary of a river; rivulet, brook, backwater

		Stunt (v) prevent (from growing) or developing properly; inhibit, impede, hamper, hinder, retard, curb; perform stunts; (n) action displaying spectacular skill and daring; something unusual done to attract attention

		Rote: (by) mechanical or habitual repetition of something to be learned ("a poem learned by rote in childhood"); parrot-fashion, mindlessly, by heart

		Tryst: (n,v) a private romantic rendezvous between lovers

		Lavish: (a) sumptuously rich, elaborate, or luxurious; lush, opulent, grand, regal, ornate, extravagant; (v) bestow something in generous or extravagant quantities on; shower, heap, expend, deluge, give unstintingly

		Maroon: (v) leave (someone) trapped and alone in an inaccessible place, especially an island; strand, leave in the lurch, forsake; (a) brownish-red color

		Strike: (v) inflict (a blow); slap, smack, thrash, thwack, cuff, crack, swat, pummel, batter, pelt, cane, lash, club, cudgel, wallop, clout, smite; accidentally hit (part of the body); (of a beam or ray of light or hit) fall on (an object or surface); produce (a musical note) by pressing or hitting a key; (of a disaster, disease, or other unwelcome phenomenon) occur suddenly and have damaging effects on; affect, afflict, smite; carry out an aggressive or violent action, typically without warning; create a particular strong emotion in (someone); cause (someone) to be in a specified state (eg: stuck dumb); (of a thought or idea) come suddenly to (someone); find particularly interesting, noticeable, or impressive; (of a clock) indicate the time by sounding a chime or stroke; (of time) be stricken; ignite or produce (a match, fire, or spark) by rubbing briskly against an abrasive surface; (from) cancel, remove, or cross out with a pen; (off) officially remove someone from membership; (down) abolish a law or regulation; make (a coin or medal) by stamping metal; (cinematography) make (another print) of a film; reach, achieve, or agree to (something involving agreement, balance, or compromise); establish, settle, endorse, sanction, clinch; discover (gold, minerals, or oil) by drilling or mining; discover, light on, chance on, happen on, stumble on/across, unearth, uncover; come to or reach; (out) move or proceed vigorously or purposefully, start out on a new or independent course or endeavor; take down (a tent or an encampment) (eg: strike camp); dismantle (theatrical scenery); lower or take down (a flag or sail), especially as a salute or to signify surrender (eg: the ship struck her German colors) (antonym: hoist); insert (a cutting of a plant) in soil to take root; (of a plant or cutting) develop roots (eg: small conifers will strike from cuttings); (on) (of a young oyster) attach itself to a bed; secure a hook in the fish by jerking or tightening the line after it has taken the bait or fly; (n) an organized refusal to do something expected or required; something to one's discredit (eg: that's two strikes, young man!); a discovery of gold, oil, or minerals by drilling or mining; the horizontal or compass direction of a stratum, fault, or other geological feature

		Fault: (n) an unattractive or unsatisfactory feature, esp. in a piece of work or in a person's character; a break or other defect in an electric circuit or piece of machinery; a misguided action or habit; defect, failing, imperfection, flaw, blemish, shortcoming, weakness, frailty, foible, Achilles heel, chink in one's armor; an extended break in a rock formation, marked by the relative displacement and discontinuity of strata on either side of a particular plane; (v) criticize for inadequacy or mistakes; condemn, impugn, reprove, reproach, haul over the coals, quibble about, carp about, arraign, grouse about, gripe about; do wrong (archaic); (of a rock formation) be broken by a fault or faults

		Stratum: a layer or a series of layers of rock in the ground; vein, seam, lode, bed, stratification, sheet, lamina; a level or class to which people are assigned according to their social status, education, or income; class, echelon, estate, sphere, caste, gradation

		Chime: a bell or a metal bar or tube, tuned and used in a set to produce a melodious series of ringing sounds when struck; (v) (of a bell or clock) make melodious ringing sounds; ring, peal, sound, dong, resound, reverberate, tinkle, jingle, knell, tintinnabulate; be in agreement with (Brit) (eg: his poem chimes with our modern experience)

		Whittle: carve (wood) into an object by repeatedly cutting small slices from it; pare, shave, hew; (down) reduce something in size, amount, or extent by a gradual series of steps; erode, consume, mar, compromise, impair, hinder, cripple, enfeeble, emasculate, sap, prune

		Slump: (v) sit, lean, or fall heavily and limply; flop, flump, subside, sag, slouch;  (v,n) undergo a sudden, severe, or prolonged  fall in price, value, or amount; plummet, tumble

		Peccadillo: a relatively minor fault or sin; misdemeanor, lapse, delinquency, slip

		Foul: (a) offensive to the senses, especially through having a disgusting smell or taste or being dirty; revolting, repugnant, repulsive, abhorrent, loathsome, appalling, vile, abominable, nauseating, stomach-churning, unpalatable, odious, unsavory, noxious, rank, rancid, fetid, malodorous, vomitous, ghastly, horrid, putrid, noisome, mephitic, miasmic, miasmal, olid, squalid, sordid, shabby, manky, befouled, begrimed, besmirched, feculent

		Trace: find or discover by investigation; dog, stalk, trail, pursue; follow or mark the course of (something) with ones eye, mind, or finger; take (a particular path or route)

		Cretonne: a heavy cotton fabric, typically with a floral pattern printed on one or both sides, used for upholstery

		Upheaval: a violent or sudden change or disruption to something; turmoil, bedlam, furore, uproar, chaos, mayhem, pandemonium; (antonym: tranquility); an upward displacement of part of the earth's crust

		Bedlam: a scene of uproar or confusion;  mayhem, unrest, hubbub, ruckus, anarchy, snafu, disorder; an institution for the care of mentally ill people (ref: st Mary of Bethlehem in London used as insane asylum)

		Furore: an outbreak of public anger or excitement; fuss, tumult, palaver, pother, stir, agitation,sansatioj, pantomime, kerfuffle; a wave of enthusiastic admiration, a craze

		Pantomime: (n) a theatrical entertainment, mainly for children, which involves music, topical jokes, and slapstick comedy and is based on a fairy tale or nursery story, usually produced around Christmas; a dramatic entertainment, originating in Roman mime, in which performers express meaning through gestures accompanied by music; an absurdly exaggerated piece of behavior; an absurd or confused situation (v) express or represent by exaggerated mime

		Ambulatory: (a) relating to or adapted for walking; movable, mobile, ambulant; (n) a place for walking, esp. an aisle or cloister in a churche or monastery

		Cloister: (n) a covered walk in a convent, monastery, or cathedral, typically with a colonnade open to a quadrangle on one side; corridor, arcade, loggia, piazza, colonnade, stoa; monastic life(v) seclude or shut up in a convent or monastery; confine, isolate, sequester, seclude

		Glandular: consisting of, containing, or bearing glands; visceral, instinctive

		Sacrilegious: profane, blasphemous, ungodly, unholy, impious

		Slumber: (v) sleep; doze, drowse, be in the arms of Morpheus

		Puny: small and weak; undernourished, undersized, slunted, slight, dwarfish, pygmy, feeble, frail; pitiable, pitiful, scant, derisory, wretched, meager, paltry, trifling, petty, exiguous

		Inordinate: unusually or disproportionately large; excessive, undue, unconscionable, exorbitant, immoderate, superfluous, extravagant, unrestrained; (of a person) unrestrained in feelings or behavior

		Superfluous: unnecessary, esp. through being more than enough; surplus, redundant, spare, excess, expendable, disposable, dispensable

		Pang: a sudden sharp pain or painful emotion

		Extemporaneous: spoken or done without preparation; extemporary, extempore, impromptu, unscripted, improvised, unrehearsed

		Scrape: drag or pull a hard or sharp implement across (a surface or object) so as to remove dirt or other matter; abrade, sandpaper, scour; make (a hollow) by scraping away sand or rock; move with a harsh scraping sound; grate, creak, jar, squeak, screech; narrowly pass by or through something; play a violin tunelessly; draw one's hair tightly back off the forehead; spread (butter or margarine) thinly over bread; just manage to achieve (something), accomplish with great effort or difficulty;  (up) collect or accumulate something with difficulty; amass, raise, muster, accumulate; (by, along) manage to live, with difficulty; cope, scrimp, make do, make ends meet (eg: they scrimped and scraped); (in) barely manage to succeed in a particular undertaking; (scrape acquaintance)

		Scrimp: be thrifty or parsimonious; economize; scrimp and scrape, be frugal, husband one's resources; draw in one's horns; rake and scrape

		Epitomize: be a perfect example of; embody, typify, exemplify, encapsulate, manifest, illustrate, personify, incarnate, reify; give a summary of (written work)

		Reify: make (something abstract) more concrete or real

		Predacious: predatory

		Serration: a tooth or point of a serrated edge or surface

		Serrated: having or denoting a jagged edge; jagged, sawtooth, notched, indented, serrate, serrulate, serratiform, crenulated, crenate, denticulate; barbed

		Jag: stab, pierce, or prick

		Eviscerate: disembowel; deprive (something) of its essential content; remove the contents of (the eyeball)

		Hearth: floor of a fireplace; used as a symbol of one's home (eg: one's hearth and home); the base or lower part of a furnace, where molten metals collect

		Somatic: relating to the body, especially as distinct from the mind

		Psychosomatic: relating to the interaction of mind and body; (of a physical illness or other condition) caused or aggravated by a mental factor such as internal conflict or stress

		Insular: ignorant of or uninterested in cultures, ideas, or people's outside ones own experience; blinkered, parochial, claustral, prejudiced; lacking contact with other people; isolated; relating to or from an island; relating to a form of Latin handwriting used in Britain and Ireland in the early Middle Ages; (of climate) equable because of the influence of the sea

		Equable: not easily disturbed or angered; calm and even-tempered; self possessed, nonchalant, insouciant, blithe, mellow, tranquil, placid, imperturbable, equanimous; not varying or fluctuating greatly

		Holler: (informal) (v) give a loud shout or cry; roar, howl, bellow, bawl, bark, bay, wail, whoop, vociferate; (n) a loud cry or shout; a melodic cry with abrupt or swooping changes or pitch, used originally by black slaves at work in the fields and later contributing to the development of the blues (eg: field holler)

		Acute: (of an unpleasant or unwelcome situation or phenomenon) present or experienced to a severe or intense degree; drastic, dire, dreadful, grave, profound, perilous, egregious; (of a disease or its symptoms) severe but of short duration; penetrating, piercing, searing, fierce, excruciating, agonizing, grievous, hellish, torturous, unbearable, more than flesh and blood can stand, exquisite, peracute; denoting or designed for patients with an acute form of disease (eg: acute ward); having or showing a perceptive understanding or inside; shrewd, razor-sharp, rapier-like, agile, nimble, ingenious, perspicatious, sapient, argute; (of a sound) high, shrill

		Galvanize: shock or excite (someone) into taking action; jolt, impel, spur, prod,  rouse, invigorate, fuel, animate, inspirit, incentivize; coat (iron or steel) with a protective layer of zinc

		Ward: (n) a separate room in a hospital, typically one allocated to a particular type of patient; an administrative division of a city or borough that typically elects and is represented by a councillor; district, division, zone, parish, canton, department; a child or young person under the care and control of a guardian appointed by parents or court; the state of being in the care of a guardian; any of the internal ridged or bars in a lock which prevent the turning of any key which does not have grooves of corresponding fork or size; the grooves of a key; he action of keeping a lookout for danger; an area of ground enclosed by the encircling walls of a fortress or castle; (v) admit (a patient) to a hospital ward; guard, protect

		Whir: (v) (of something rapidly rotating or moving to and fro) make a low, continuous, regular sound; (n) a whirring sound

		Whirl: (v) move or cause to move rapidly round and round; swivel, gyrate, twirl, spin, pirouette, birl; (of the head, mind, or senses) seem to spin round; reel; (n) a rapid movement round and round; swirl, flurry, eddy; frantic activity of a specified kind

		Disparage: regard or represent as being of little worth; belittle, denigrate, disdain, deride, ridicule, scoff at, sneer at, misprize, asperse, derogate, caluminatr, vilipend, vituperate; (a) derogatory, deprecatory, slighting, contemptuous, uncharitable, snide, contumelious

		Caustic: (a) able to burn or corrode organic tissue by chemical action; corrosive, mordant, acrid; sarcastic in a scathing and bitter way; sardonic, trenchant, acerbic, vitriolic, acrimonious, rapier-like, mordacious; formed by the intersection of reflected or refracted parallel rays from a curved surface; (n) a caustic surface or curve

		Squall: (n) a sudden violent gust of wind or localized storm, especially one bringing rain, snow, or sleet; a loud cry; (v) (of a baby or small child) cry noisily and continuously

		Gale: a very strong wind; storm, tempest, flaw; a storm at sea; an outburst of laughter

		Hoot: (n, v) a low, wavering musical sound which is the typical call of many kinds of owl; a raucous sound made by a horn, siren, or steam whistle; a shout expressing scorn or disapproval; howl, jeer, catcall; (n) an amusing situation or person

		Traduce: speak badly of or tell lies about (someone) so as to damage their reputation; besmirch, disparage, smear, impugn, asperse

		Asperse: attack or criticize the reputation or integrity of

		Calumny: (n) the making of false and defamatory statements about someone in order to damage their reputation; slander, libel, obloquy, vituperation, aspersions, contumely, muckraking; (v) slander

		Contumely: (n) insolent or insulting language or treatment; opprobrium, vituperation, discourtesy

		Opprobrium: harsh criticism or censure; public disgrace arising from shameful conduct; ignominy, odium, disesteem, disrepute, infamy, notoriety; an occasion or cause for reproach or disgrace

		Disesteem: (n) low esteem or regard; (v) have a low opinion of

		Contumelious: (of behavior) scornful and insulting; insolent (like contumely)

		Snide: derogatory or mocking in an indirect way; (of a person) devious and underhand

		Acerbic: (especially of a comment or style of speaking) sharp and forthright; incisive, trenchant, caustic, mordant, acerb; tasting sour or bitter

		Mordacious: denoting or using biting sarcasm or invective; (of a person or animal) given to biting

		Acrimony: bitterness or ill feeling; spleen, grudge, hostility

		Shrewd: having or showing sharp powers of judgement, astute; cunning, wily; (esp. of weather) piercingly cold; (of a blow) severe; mischievous, malicious

		Cunning: (a) having or showing skill in acieving one's ends by deceit or evasion; wily, devious, sly, scheming, shrewd, adroit, deft, vulpine, carny; attractive or quaint; (n) skill in achieving one's ends by deceit; guile, ingenuity, wiles, ploys, stratagem, manoeuvres, subterfuge, ruses; ingenuity

		Vulpine: relating to foxes; crafty, cunning

		Ingenious: (of a person) clever, original, and inventive; (of a machine or idea) cleverly and originally devised and well suited to its purpose

		Sapient:(a) wise, or attempting to appear wise; (chiefly in science fiction) intelligent (eg: sapient life forms); relating to the human species; (n) a human

		Parochial: relating to a church or parish; having a limited or narrow outlook or scope; provincial, insular, blinkered, myopic, hidebound

		Cosmopolitan: (a) familiar with and at ease in many different countries and cultures; worldly, suave, seasoned, experienced; including people from many different cultures; having an exciting and glamorous character associated with travel and a mixture of cultures; (of a plant or animal) found all over the world; (n) cosmopolitan person or animal

		Suave: (especially of a man) charming, confident, and elegant; gentlemanly, debonair, affable, tactful, mannerly

		Debonair: (of a man) confident, stylish, and charming; gracious, chivalrous, courteous, genteel, soigné, dashing, dapper, spruce

		Dashing: (of a man) attractive, adventurous, and confident; debonair, jaunty, devil may care; stylish and fashionable

		Jaunty: having or expressing a lively cheerful, and self-confident manner; merry, jolly, vivacious, blithe, sprightly, ebullient, exuberant, perk, insouciant, bubbly, buoyant, spry, breezy, gleeful

		Ebullient: cheerful and full of energy; euphoric, jubilant, vivacious, jaunty; (of a liquid or matter) boiling or agitated as if boiling

		Perk: (v) (up) become or make more cheerful, lively, or interesting; cheer up, take heart, liven up, revive, rally; revitalize, invigorate, enliven, ginger up, rejuvenate, inspirit, refresh, vivify; a benefit to which one is entitled; appanage, perquisite, lagniappe, premium, fringe benefit (v) percolate; (n) a coffee percolator

		Percolate: (of a liquid or gas) filter through a porous surface or substance; drip, ooze, seep, trickle, dribble, leak, leach, filtrate, transude

		Appanage: a provision made for the maintenance of the younger children of kings and princes, consisting of a gift of land, an official position, or money; a benefit of right belonging to someone, a perquisite

		Perquisite: a benefit which one enjoys or is entitled to on account of one's job or position; a thing which has served its primary use and to which a subordinate or employee has a customary right

		Spry/sprightly: (especially of an old person) active,lively; vigorous, jaunty, perky, full of vim and vigor, frolicsome

		Vivacious: (especially of a woman) attractively lively and animated; effervescent, ebullient, scintillating, sparkling, vibrant

		Dodder: (v) tremble or totter, typically because of old age; teeter, hobble, move falteringly, lurch, reel; (n) a widely distributed parasitic climbing plant of the convolvulus family, with leafless thread-like stems that are attached to the host plant by means of suckers

		Doddery: slow and unsteady in movement because of weakness in old age

		Spruce: (n) Christmas tree; (a) neat in dress and appearance; besuited, elegant, soigné, dapper, snazzy, spiffy; (v) (up) make someone or something smarter or tidier; engage in pretense or deception, especially by feigning illness

		Feign: pretend to be affected by ( a feeling, state, or injury); sham, fake, affect, pretend, masquerade, posture, malinger, bluff, pose; invent )a story or excuse)

		Devil-may-care: cheerful and reckless; daredevil, impetuous, hot-headed, overhasty, foolhardy, headlong, imprudent, flippant, insouciant, death-or-glory, temerarious

		Foolhardy: recklessly bold or rash; incautious, heedless, injudicious

		Hidebound: unwilling or unable to change because of tradition or convention; conservative, diehard, orthodox

		Emaciatied: abnormally thin or weak, especially because of illness or a lack of food; skeletal, scraggy, scrawny, angular, undernourished, cadaverous, shriveled, gaunt, haggard

		Gaunt: (of a person) lean and haggard, especially because of suffering, hunger, or age; raddled

		Myopic: short sighted; lacking foresight or intellectual insight

		Claustral: relating to a cloister or religious house; enveloping; confining

		Bay: a broad inlet of the sea where land curves inwards; cove, estuary, gulf, basin, fjord; an indentation or recess in a range or mountains; an evergreen Mediterranean shrub with deep green leaves and purple berries. It's aromatic leaves are used in cookery and were formerly used to make triumphal crowns for victors; a space created by a window line protruding outwards from a wall; alcove, recess, niche, nook, hollow, cavity, booth, apse; a section of the wall between two buttresses or columns, especially in the nave of a church; a compartment with a specified function in a vehicle, aircraft, or ship; (v) (of a dog, especially a large one) bark or owl loudly; snarl, bellow, clamor, ululate; (of a group of people) shout loudly, typically to demand something; bay at; (n) sound of baying

		Buttress: (n) a structure of stone or brick built against a wall to strengthen or support it; abutment, prop, shore, pier, reinforcement, stanchion, strut; a projecting portion of a hill or mountain; a source of defense or support; (v) provide (a structure) with buttresses; increase the strength of or justification for; reinforce

		Nave: the central part of a church building, intended to accommodate most of the congregation. In traditional western churches, it is rectangular, separated from the chancel by a step or rail, and from adjacent aisles by pillars; the hub of a wheel

		Cove: (n) a small sheltered bay; a concave arch or arched molding , especially one formed at the junction of a wall with ceiling; (v) provide (a room, ceiling, etc.) with a cove

		Apse: a large semicircular or polygonal recess in a church, arched or with a domed roof and typically at the church's eastern end

		Strut: (n) a rod or bar forming part of a framework and designed to resist compression; a stiff, erect, and apparently arrogant or conceited gait; (v) walk with stiff, erect, and apparently arrogant or conceited gait; swagger, prance, stride, peacock, flounce, swank, parade; brace with struts

		Wail: a prolonged high pitched cry of pain, grief, or anger; bawl, cry, shriek, lament, sob, shriek, caterwaul; (v) utter a wail; manifest or feel deep sorrow for; lament

		Caterwaul: (v, n) (of a cat) make a shrill howling or wailing noise

		Egregious: outstandingly bad; shocking;  (archaic) remarkably good (sense 1 originally ironic)

		Philistine: (n, a) a person who is hostile or indifferent to culture and the arts

		Dowager: a widow with a title or property derived from her late husband; a dignified elderly woman

		Pummel: strike repeatedly with the fists; severely criticize

		Lash: (v) strike or beat with a whip or stick; pummel, belabor, wallop, belt, birch, belt, came, whip, flog; drive someone into (a particular state or condition); (of an animal) move (a part of the body, especially the tail) quickly and violently; (down) fasten (something) securely with a rope; bind, tether, hitch, knot, rope, strap, leash, fetter, chain, secure; (n) the flexible leather part of a whip, used for administering blows; punishment in the form of beating with a whip or rope

		Effect: (v) cause (something) to happen; bring about; effectuate, call forth, occasion, engender, carry out, consummate

		Lamina: a thin layer, plate, or scale of sedimentary rock, organic tissue, or other material

		Lode: a vein of metal ore in the earth; a rich source of something

		Knell: (n) the sound of a bell, especially used when rung solemnly for a death or funeral; death knell, chime; used in reference to an announcement, event, or sound that warns of the end of something (eg: texts are sounding the knell for the written word); (v) ring solemnly, esp. for a death or funeral; proclaim (something) by or as if by a knell

		Pare: trim (something) by cutting away its outer edges; (down) reduce in size or amount in a number of small successive stages; whittle, prune, curtail

		Mar: impair the quality or appearance of; spoil, mutilate, blemish, scar, deface, impair, wreck, sully, tarnish, pollute, vitiate

		Prune: (v) trim (a tree, shrub, or bush) by cutting away dead or overgrown branches or stems, especially to encourage growth; crop, clip, shear, pollard, neaten; reduce the extent of (something) by removing superfluous or unwanted parts; (n) an instance of trimming a tree, shrub, or bush; a dried plum, an unpleasant or disagreeable person

		Mephitic: (especially of gas or vapor) foul-smelling, noxious

		Halitosis: bad breath

		Noisome: having an extremely offensive smell; very disagreeable or unpleasant

		Olid: smelling extremely unpleasant

		Inlet: a small arm of the sea, a lake or river; cove, bay, fjord, estuary; a place or means of entry; (tailoring or dressmaking) a piece of material inserted into a garment

		Estuary: the tidal mouth of a large river, where the tide meets the stream; firth

		Fjord: a long narrow, deep inlet of the sea between high cliffs, typically formed by the submergence of a glaciated valley

		Fleet: (n) a group of ships sailing together, engaged in the same activity, or under the same ownership; a country's navy; (a) fast and nimble in movement (eg: fleet of foot); (v) move or pass quickly; pass (time) rapidly; (away) fade away, be transitory

		Tributary: a river or stream flowing into a larger river or lake; influent; a person or state that pays tribute to another state or ruler

		Brook: (n) a small stream; rivulet, gill, beck, bourn, billabong; (v) tolerate or allow (something, typically dissent or opposition); abide, allow, endure, stomach, bear, stand, countenance, withstand, suffer, thole

		Thole: (n) a pin fitted to the gunwale of a rowing boat and on which an oar pivots; (v) endure (something) without complaint or resistance; tolerate

		Rivulet: a small stream of water or another liquid

		Backwater: a part of a river not reached by the current, where the water is stagnant; an isolated or peaceful place; a place or situation in which no development or progress is taking place

		Bight: a curve or recess in a coastline, river, or other geographical structure; a loop of rope

		Deluge: (v,n) severe flood; torrent, spate; the biblical flood; a heavy rainfall; a great quantity of something arriving at the same time

		Forsake: abandon or leave; desert, jilt, leave in the lurch, walk out on; abandoned, deserted, stranded; desolate, bleak, godforsaken, derelict, dreary, forlorn; renounce or give up (something valued or pleasant); relinquish, forgo, dispense with, disavow, jettison, repudiate, eschew

		Dessicate: (as dessicated) remove the moisture from (something), typically in order to preserve it; dehydrated, dried; lacking interest, passion, or energy

		Parch: make or become dry through intense heat; torrefy; roast (corn, peas, etc.) lightly; extremely thirsty

		Torrefy: roast, scorch, or dry (a substance such as an ore, a drug, or a fuel) with heat to drive off all moisture

		Singe: (v) burn (something) superficially or lightly; scorch, sear, char, blacken; (n) a superficial burn

		Sear: burn or scorch the surface of (something) with a sudden, intense heat; scald, singe, desiccate, carbonized, cauterize; distress, grieve; (on) fix (an image or memory) permanently in someone's mind or memory; (of pain) be experienced as a sudden, burning sensation; cause to wither; make (someone's conscience or feelings) insensitive;

		Sere: (also sear) especially of vegetation: dry or withered; a natural succession of plant (of animal) communities, especially a full series from uncolonized habitat to the appropriate climax vegetation

		Disembogue: (of a river or stream) emerge or be discharged in quantity, pour out

		Effuse: give off (a liquid, light, smell, or quality; talk in an unrestrained, excited manner

		Ribbed: (especially of a fabric or garment) having a pattern or raised bands; (of a vault or other structure) strengthened with ribs

		Rib: (v) mark with or form into ridges; provide with ribs; (n) a long raised piece of strengthening or supporting material in particular: a curved member supporting a vault or defining its form; a curved transverse strut of metal or timber in a ship, extending up from the keel and forming part of the framework of the hull, curved pieces of wood forming the sides or a violin, hinged rods supporting the fabric of an umbrella; vein of a leaf or an insect's wing; ridge of rock or land

		Weal: (n) a red, swollen mark left on flesh by a blow or pressure; an area of the skin which is temporarily raised, typically reddened, and usually accompanied by itching; that which is best for someone or something (eg: public weal); (v) mark with a weal

		Pelagic: (a) relating to the open sea; inhabiting the upper layers of the open sea; (of a bird) inhabiting the open sea and returning to the shore only to breed (n) a pelagic fish or bird

		Swidden: clear (land) by slashing and burning vegetation

		Subversive: seeking or intended to subvert (undermine the power and authority of) an established system or institution

		Vapid: offering nothing that is stimulating or challenging; bland; insipid, dull, tedious, zestless, anemic, tame, jejune, vacuous, trite, pallid

		Byzantine: relating to the Byzantine empire or the Eastern Orthodox Church; (of a system or situation) excessively complicated, and typically involving a great deal of administrative detail; convoluted; characterized by deviousness or underhand procedure

		Asinine: extremely foolish or stupid; senseless, doltish, lunatic, ludicrous, absurd, fatuous, preposterous, nonsensical, inane, cretinous, moronic

		Sift: (v) put (a fine or loose substance) through a sieve; examine (something) thoroughly so as to isolate that which is most important; (n) act of sifting

		Pontificate: (v) express one's opinions in a pompous and dogmatic way; (in the Roman Catholic Church) officiate as bishop; (n) office or period of office of a pope or bishop

		Pituitary: the major endocrine gland, a pea-sized body attached to the base of the brain that is important in controlling growth and development and the functioning of the other endocrine glands

		Kafkaesque: marked by a senseless, disorienting, often menacing complexity; marked by surreal distortion and often a sense of impending danger

		Equanimity: calmness and composure, especially in a difficult situation (antonym: anxiety)

		Taciturn: (of a person) reserved or uncommunicative in speech; mute, dumb, dour, sullen, aloof

		Querulous: complaining in a rather petulant or whining manner; petulant, pettish, fractious, irritable, crabby, crotchety, cantankerous, curmudgeonly, surly, churlish, bilious, liverish, dyspeptic, splenetic, choleric

		Insipid: lacking flavor, weak or tasteless; lacking vigor or interest; vapid, anaemic, lackluster, lusterless, prosaic, pedestrian, hackneyed

		Anaemic: suffering from anaemia (blood red cell deficiency, resulting in pallor and weariness); jaundiced, pallid, wan, sickly, sallow, etiolated; lacking in color, spirit, or vitality; insipid, vapid

		Sallow: (of a person's face or complexion) of an unhealthy yellow or pale brown color

		Lymphatic: (a) relating to lymph or its secretion; (of a person) pale, flabby, or sluggish; (n) a vein-like vessel conveying lymph in the body

		Lymph: a colorless fluid containing white blood cells, which bathes the tissues and drains through the lymphatic system into the bloodstream; pure water

		Etiolated: (v, a) (of a plant) pale and drawn out due to a lack of light; (a)  having lost vigor or substance; feeble

		Haulm: a stalk or stem; the stalks or stems collectively of peas, beans, or potatoes without the pods or tubers, especially after the crime has been gathered

		Jejune: naive, simplistic, and superficial; (of ideas or writings) dry and uninteresting

		Prosaic: using the style or fiction of prose as opposed to poetry; lacking imaginativeness or originality; dull, pedestrian, mundane, plodding, jejune, banal, unadorned, bland, insipid, vapid; commonplace, unromantic; humdrum, routine, run-of-the-mill, dreary, tedious, monotonous

		Plod: walk doggedly and slowly with heavy steps; trudge, stomp, tramp, lumber, slog; work slowly and perseveringly at a dull task; wade, plough, toil, trawl, proceed laboriously, labor

		Trawl: (v) (for or others) fish with a trawl net or seine; drag or trail (something) through water (eg: she trawled a toe to test the temperature); (through) search thoroughly; (n) an act of fishing with a trawl net or seine; a large wide-mouthed  fishing net dragged by a boat along the bottom of the sea; a thorough search; a long sea-fishing line along which are tied buoys supprting baited hooks on short lines

		Wade: (v) walk with effort through water or another liquid or viscous substance; wallow, paddle, dabble, squelch, plod, trudge, ford, traverse, cross; walk through (something filled with water) (eg: I waded ditches); read laboriously through (a long piece of writing); peruse, browse, leaf, trawl, plough; (informal) intervene in (something) or attack (someone) vigorously or forcefully; assault, rush, storm, lunge at, charge, weigh into, lash out at; (in) make a vigorous attack or intervention; (n) an act of wading

		Ford: (n) a shallow place in a river or stream allowing one to walk or drive across; crossing, causeway, drift; (v) (of a person or vehicle) cross (a river or stream) at a shallow place

		Causeway: a raised road or track across low or wet ground

		Pedestrian: (a) lacking inspiration or excitement; dull, plodding, wearisome, tiresome, repetitive, repetitious, run-of-the-mill, turgid, stodgy, mundane, humdrum

		Wayfarer: a person who travels on foot; foot traveller, nomad, gypsy, vagabond, vagrant, drifter, footslogger

		Turgid: swollen and distended or congested (eg: a turgid river); (of language or style) tediously pompous or bombastic; overripe, high-flown, affected, grandiose, florid, ornate, magniloquent, grandiloquent, oratorical, orotund, stodgy, ponderous, tumid, euphuistic, fustian, sesquipedalian, Ossianic, aureate

		Florid: having a red or flushed complexion; rosy, roseate, rubicund, sanguine,blowsy, erubescent, rubescent; excessively intricate or elaborate; over-elaborate, curlicued, baroque, ostentatious; (of language) using unusual words or complicated rhetorical devices; (of a disease or its manifestations) occurring in a fully developed form

		Rubescent: reddening, blushing

		Baroque: relating to or denoting a style of European architecture, music, and art of the 17th and 18th centuries that followed Mannerism and is characterized by ornate detail. (Versailles, work of Wren in England; Vivaldi, Bach, Handel; Caravaggio, Rubens); highly or are and extravagant in style

		Blowsy: (of a woman) coarse, untidy, and red-faced; disheveled, slovenly, slatternly, unkempt, frowzy, slipshod, bedraggled, ruddy, florid, raddled, rubicund, rubescent

		Slovenly: (of a person) untidy and dirty; blowsy, tousled, rumpled, draggle-tailed; (of a person or action) careless, excessively casual; slapdash, haphazard, neglectful, lax, lackadaisical

		Tousle: make (something, especially a person's hair) untidy

		Rumple: (v) give a creased, ruffled, or disheveled appearance to; crumple, crease, wrinkle, tumble, crinkle, ruck, ruckle, riffle; (n) an untidy state

		Riffle: (v) (through) turn over something, especially the pages of a book, quickly and casually; search quickly through (something); shuffle (playing cards) by flicking up and releasing the corners or sides of two piles of cards so they intermingle and may be slid together to form a single pile; (n) act or sound of riffling through something; a rocky or shallow part of a stream or river where the water flows brokenly; a patch of waves or ripples

		Haphazard: lacking any obvious principle of organization; chaotic

		Slapdash (a, ad) done too hurriedly and carelessly; haphazard, remiss, cursory, perfunctory

		Remiss: lacking care or attention to duty; negligent, oscitant, unheeding, dilatory, indolent, derelict

		Oscitant: yawning from drowsiness

		Dilatory: slow to act; slothful, idle, indolent, sluggish; intended to cause delay; lingering, dawdling, dallying, tarrying, Fabian

		Dally: act or move slowly; dawdle, loiter, linger, trail, straggle; have a casual romantic or sexual liaison with, trifle, philander; show a casual interest in

		Fabian: (n) member or supporter of the Fabian society, an organization of socialists aiming to achieve socialism by gradual rather than revolutionary means (Nehru belonged; founded LSE); (a) relating to or characteristic of the Fabians; employing a cautiously persistent and dilatory strategy to wear out an enemy

		Philander: (of a man) readily or frequently enter into casual sexual relationships with women; coquet, trifle/toy/dally with someone's affections

		Coquet/Coquette: (v) behave flirtatiously; (n) a man/woman who flirts

		Coquetry: flirtatious behavior

		Ruck: (n) a loose scrum formed around a player with the bales on the ground; a tightly packed crowd of people; the mass of ordinary people or things; a crease of wrinkle; (v) compress or move (cloth or clothing) so that if forms a number of untidy folds or creases; wrinkle, crinkle, cockle, rumple, pucker, corrugate, ruffle, crease, furrow, crimp, gather, pleat, ruckle; (of cloth or clothing) form rucks

		Crinkle: (v) form into small surface creases or wrinkles; crease, furrow, corrugate; (n) a wrinkle or crease

		Corrugated: (a) of a material or surface) shaped into a series of parallel ridges and grooves so as to give added rigidity and strength; fluted, furrowed, grooves, striate, striated; (v) (corrugate) contract or cause to contract into wrinkles or folds

		Furrow: (n) a long, narrow trench made in the ground by a plough, especially for planting seeds or irrigation (opposite of ridge); groove, trough, gash, seam, gouge; a line or wrinkle on a person's face; crow's foot, cleft, sulcus, crease; (v) make a rut, groove or trail in (the ground or the surface of something; (with reference to the forehead or face) mark or be marked with lines or wrinkles caused by frowning, anxiety, or concentration (eg: a look of concern furrowed his brow)

		Striate: (v,a) marked with striae (linear marks, slight ridges, or grooves, often one of a number of similar parallel features

		Sulcus: a groove or furrow, especially one on the surface of the brain

		Crow's foot: a branching wrinkle at the outer corner of a person's eye; a mark, symbol, or design formed of lines diverging from a point, resembling a bird's footprint; a military caltrop

		Caltrop: a spiked metal device thrown on the ground to impede wheeled vehicles or (formerly) cavalry horses; a creeping plant with woody carpels that typically have hard spines and resemble military caltrops

		Carpel: the female reproductive organ of a flower, consisting of an ovary, a stigma, and usually a style. It may occur  singly or as one of a group

		Stigma: a mark of disgrace associated with a particular circumstance, quality, or person; smirch, blemish, stain, taint, blot; (in Christian tradition) marks corresponding to those left on christs body by the crucifixion, said to have been impressed by divine favor on the bodies of st Francis of Assissi and others; a visible sign or characteristic of a disease; (in a flower) the part of the pistil that receives the pollen during pollination; etymology: mark made by pricking or branding

		Cleft: (a) split, divided, or partially divided into two; (n) a fissure or split, esp. in rock or the ground; crevice, chasm, rift, fracture, gash, cranny, interstice

		Cleave: split or sever (something), especially along a natural line or grain; bisect, rend, sunder, rive; split (a molecule) by breaking a particular chemical bond; (of a cell) divide; make way through (something) forcefully, as if by splitting it apart; bulldoze

		Cranny: a small, narrow space or opening; nook, recess, cavity, alcove, interstice

		Rift: (n) a crack, split, or break in something; cranny, interstice, fissure; a major fault separating blocks of the earth's surface; a Rift Valley; a serious break in friendly relations; (v) form fissures or breaks, especially through large-scale faulting; move apart; tear or force (something) apart

		Chasm: a deep fissure in the earth's surface; abyss, canyon, ravine, gully, pass, defile, couloir, cleft, rift, crevasse; a profound difference between people, viewpoints, feelings, etc; schism, rift, severance, rupture, estrangement, disunion, scission

		Defile: (v) damage the purity or appearance of; mar or spoil; befoul, debase, tarnish; desecrate or profane (something sacred); rape or sexually assault (a woman); (of troops) March in a single file; (n) a steep sided narrow gorge or passage (originally one requiring troops to march in a single file)

		Couloir: a steep, narrow gully on a mountainside

		Gully: (n) a ravine formed by the action of water; a deep artificial channel serving as a gutter or drain; (v) (of water) make gullies or deep channels in (land)

		Gill: (n) the paired respiratory organ of fish and some amphibians, by which oxygen is extracted from water; the vertical plates arranged radially on the underside of mushrooms and many toadstools; the wattles or dewlap of a domestic fowl; a deep ravine, especially a wooden one; a narrow mountain stream; a female ferret; (derogatory) a young woman; (v) cut or clean (a fish); catch (a fish) in a gill net

		Wattle: (n) a colored, fleshy lump hanging from the head or neck of the turkey and some other birds; a material for making fences, walls, etc., consisting of rods or stakes interlaced with twigs or branches; (v) make, enclose, or fill up with wattle

		Dewlap: a fold of loose skin hanging from the neck or throat of an animal or bird, especially that present in many cattle

		Thrutch: (n) a narrow gorge or ravine; (v) (mountaineering) (up) push, press, or squeeze into a space

		Coulee: a short flow of viscous lava

		Flume: an artificial channel conveying water, typically used for transporting logs or timber; a winding tubular slide or chute at a swimming pool or amusement park

		Sever: divide by cutting or slicing, especially suddenly and forcibly; put an end to (a connection or relationship); break off

		Sunder: split apart

		Rive: (riven) split or tear apart violently; split or crack (wood or stone)

		Wrench: (v,n) pull or twist suddenly and violently; jerk, seize, snatch, prise; (v) injure (a part of the body) as a result of a sudden twisting movement; distort to fit a particular theory or interpretation; turn (something, esp. a nut or bolt) with a wrench; (n) a feeling of sadness or distress caused by one's own or another's departure

		Prise: use force in order to move, move apart, or open (something); wrest, jemmy, pry, wrench; obtain (something) from (someone) with effort or difficulty

		Wrest: forcible pull (something) from a person's grasp; take (something, especially power or control) after considerable effort or difficulty; distort the meaning or interpretation of (something) to suit one's own interests or views

		Jemmy: a short crowbar used by a burglar to force open a window or door

		Gash: (n) a long, deep cut or wound; a cleft made as if by a slashing cut; (v) make a long, deep cut in

		Crease: (n) a line or ridge produced in paper or cloth; a wrinkle or furrow in the skin, esp. of the face; (v) make a crease in; (of a bullet) graze (someone or something)

		Crumple: (v) crush (something, typically paper or cloth) so that it becomes creased and wrinkled; become creased, bent, or crooked; (of a person) suddenly flop down to the ground; crumble, collapse, cave in, be overcome; (of a person's face) suddenly sag and show an expression of desolation; (n) a crushed fold, crease, or wrinkle

		Ruddy: (of a person's face) having a healthy red color; (v) make ruddy in color

		Bedraggled: disheveled; muddy, sodden

		Draggle: make (something) dirty or wet, typically by trailing it through mud or water; hang untidily; trail behind others, lag behind

		Frowzy: scruffy and neglected in appearance; slovenly, slatternly, bedraggled; dingy and stuffy; musty, stagnant, stifling

		Dingy: gloomy and drab; tenebrous, dowdy, dreary, dismal, sombre, grim

		Stifle: make (someone) unable to breathe properly; smother, asphyxiate, suffocate; restrain (a reaction) or stop oneself acting on (an emotion); suppress, withhold, muffle, quench, curb, silence, contain; prevent or constrain (an activity or idea); hinder, hamper, impede, curb, inhibit, subdue, deaden

		Quench: (v) satisfy (one's thirst) by drinking; satisfy (a desire); slake, assuage, sate, satiate, gratify, appease, stifle; extinguish (a fire); smother, douse;  stifle or suppress (a feeling); reduce (someone) to silence; rapidly cool (red-hot metal or other material) esp. in cold water or oil; suppress or damp (an effect such as luminescence, or an oscillation or discharge); (n) an act of quenching a very hot substance;

		Slake: quench or satisfy (one's thirst); satisfy (desires)

		Assuage: make (an unpleasant feeling) less intense; alleviate, soothe, mitigate, palliate, abate, subdue, mollify, tranquilize, dilute, attenuate, lull; satisfy (an appetite or desire); slate, allay, satiate, quench, quell, indulge

		Mitigate: make (something bad) less severe, serious, or painful; placate, palliate, assuage; palliative

		Palliate: make (a disease or its symptoms) less severe without removing the cause; alleviate, relieve, soothe, assuage; disguise the seriousness of (an offense); conceal, whitewash, cover, camouflage, cloak, mask, downplay, minimize; allay or moderate (fears or suspicions)

		Mollify: appease the anger or anxiety of (someone); conciliate, placate, quieten, propitiate, pacify, humor; reduce the severity of (something); cushion, mitigate, lull, temper, allay, assuage

		Propitiate: win or regain the favor of (a god, spirit, or person) by doing something that pleases them

		Lull: (v) calm or send to sleep, typically with soothing sounds or movements; make (someone) feel deceptively secure or confident; (of a noise or a storm) abate or fall quiet; (n) a temporary interval of quiet or lack of activity

		Allay: diminish or put at rest (fear, suspicion, or worry); relieve or allievate (pain or hunger)

		Deaden: make (a noise or sensation) less strong or intense; numb, dull, assuage, muffle, mute, buffer; deprive of the power of sensation; benumb, desensitize, anesthetize; deprive of force or vitality; stultify; make (someone) insensitive to something (eg: laughter might deaden us to the moral issue)

		Slatternly: (of a woman or her appearance) dirty and untidy; slovenly

		Rubicund: (esp. of someone's face) having a ruddy complexion

		Roseate: rose-colored; used in names of birds with partly pink plumage

		Sanguine: optimistic or positive, especially in an apparently bad or difficult situation; buoyant, bright, assured; (in medieval science) of or having the constitution associated with the predominance of blood among the bodily humors, supposedly marked by a ruddy complexion and an optimistic disposition; blood-red; (of the complexion) florid or ruddy

		Aureate: made or having the color of gold; (of language) highly ornamented or elaborate

		Ponderous: slow and clumsy because of great weight; cumbersome, heavy-footed, lumbering, graceless, ungainly, maladroit, cumbrous; (of speech or writing) dull or laborious; plodding, pedestrian, solemn, turgid, stolid, dreary, pedantic, verbose, intricate

		Ungainly: (of a person or movement) awkward, clumsy; gauche, bumbling, lumbering, oafish, bovine, gawky, gangling

		Gauche: unsophisticated and socially awkward

		Oafish: rough or clumsy and unintelligent; loutish, boorish, lumpen

		Gangling: (of a person) tall, thin, and awkward in movements or bearing; lanky, rangy, spindly, spindling, scrawny, gaunt, skeletal, ungainly

		Lanky: (of a person) ungracefully thin and tall; pinched, attenuated, emaciated

		Pinched: tense and pale from cold, worry, or hunger; fraught, taut, worn, wan, pesky, pallid, pasty, anaemic, ashen, haggard, cadaverous, wizened; suffering from financial hardships

		Ashen: (of a person's face) very pale with shock, fear, or illness; etiolated, lymphatic, wan, waxen, leaden; of or resembling ashes

		Wizened: shriveled or wrinkled with age; withered, gnarled, sere

		Gnarled: knobbly, rough, and twisted, esp. with age; (eg: the gnarled trunk of an old tree) crooked, nodose, wry, wizened, thrawn

		Gnarl: a rough knotty protuberance, especially on a tree

		Knobbly: having lumps which give a misshapen appearance

		Rangy: (of a person) tall and slim with long, slender limbs

		Spindly: long or tall and thin; weak or insubstantial in construction; rickety, flimsy, frail

		Spindle: a slender rounded rod with tapered ends used in hand spinning to twist and wind a thread from a mass of wool or flax held on a distaff; a measure of length for yarn; a turned piece of wood used as a banister or chair leg; a rod or pin serving as an axis that revolves or on which something revolves

		Taper: (v) diminish or reduce in thickness towards one end; gradually lessen; dwindle, subside, decline, wane, ebb, abate, wind down, slacken (off), wilt, plummet, slump; (n) a slender candle; a wick coated with wax for conveying a flame; a gradual narrowing

		Gawky: nervously awkward and ungainly; gauche, lumbering, maladroit, bumbling, bashful, graceless, unworldly

		Maladroit: inefficient or inept; heavy-handed, inelegant, gauche, uncoordinated, gawky, clodhopping, flat-footed, tactless, undiplomatic, impolitic

		Lumbering: moving in a slow, heavy, awkward way

		Anathema: something or someone that one vehemently dislikes; abhorrent, odious, repellent; abomination, aversion, outrage, bane, bugbear, Bête noire, pariah; a formal curse by a pope or a council of the Church, excommunicating a person or denouncing a doctrine; ban, damnation, proscription, denunciation, malediction, execration, imprecation; a strong curse

		Pulpit: a raised enclosed platform in a church or chapel from which the preacher delivers a sermon; lectern, podium, stage, dais, rostrum, tribune; ("the pulpit") religious teaching as expressed in sermons (eg: movies could rival the pulpit); a raised platform in the bows of a fishing now or whaler

		Vicar: (in the Church of England) an incumbent of a parish where tithes formerly passes to a chapter or religious house or layperson; (in other Anglican Churches) a member of the clergy deputizing for another (eg: vicar of Christ)

		Levity: the treatment of a serious matter with humor or lack of due respect; frivolity, mirth, merriment, jollity, drollery, facetiousness, flippancy, triviality, blitheness, skittishness

		Arrogate: take or claim (something) without justification; hijack, seize, expropriate, wrest, usurp, steal

		Panoply: an extensive or impressive collection; a splendid display; regalia, trappings, display, spectacle, ceremony, ritual; a complete suit of armor

		Remiss: lacking care or attention to duty; negligent, neglectful, slipshod, lackadaisical, dilatory, indolent, delinquent

		Triumvirate: (in Ancient Rome) a group of three men holding power, in particular (the first triumvirate) the unofficial coalition of Julius Caesar, Pompey, and Crassus in 60 BC and (the second) with Antony, Lepidus, and Octavian in 43 BC; a group of three powerful or notable people or things

		Yearn: have an intense feeling of longing for something, especially something that one has lost or been separated from; long, pine, covet, lust, ache, hanker after, fancy, be athirst for, be desirous, suspire for

		Catatonic: (relating to or characterized by catatonia (abnormality of movement and behavior arising from a disturbed mental atate); in an immobile or unresponsive stupor

		Orotund: (of a person's voice) resonant and imposing; sonorous, full-toned, fruity, resonant, booming, canorous (of writing, style, or expression) pompous or pretentious; affected, mannered, grandiose, ornate, flowery, florid, inflated, oratorical, grandiloquent, turgid, aureate, fustian, euphuistic

		Euphuism: an artificial, highly elaborate way of writing or speaking

		Canorous: (of song or speech) melodious or resonant

		Stodgy: (of food) heavy, filling, and high in carbohydrates; dull and uninspired; lacking originality or excitement; dull, dreary, prosaic, staid, stuffy, ponderous, plodding, pedantic, verbose; bulky or heavy in appearance

		Staid: sedate, respectable, and unadventurous; serious, solemn, grave, sober, decorous, prim, demure

		Decorous: in keeping with good taste and propriety; polite and restrained; proper, befitting, decent, becoming, appropriate, suitable, genteel, dignified, staid, demure, (humorous) couth

		Couth: (a) cultured, refined, and well mannered; (n) good manners, refinement

		Demure: (a) (of a woman or her behavior) reserved, modest, and shy; meek, modest, bashful, diffident, timid, timorous, coy, maidenly, prim, straight-laced, puritanical; (of clothing) suggesting that a woman is demure

		Meek: quiet, gentle, and easily imposed on; submissive; self-effacing, spineless, diffident, unassuming

		Bashful: reluctant to draw attention to oneself; shy, diffident, inhibited, sheepish, embarrassed

		Sheepish: showing or feeling embarrassment from shame or lack of self-confidence; contrite, bashful, rueful

		Contrite: feeling or expressing remorse at the recognition that one has done wrong; apologetic, conscience-stricken, compunctious, in sackcloth and ashes

		Timorous: showing or suffering from nervousness or a lack of confidence; trepidatious, diffident, bashful

		Trepidation: a feeling of fear or anxiety about something that may happen; disquiet(ude), dismay, discomposure, foreboding (antonym: equanimity); trembling movements or motion

		Coy: (esp. with reference to a woman) making a pretense of shyness or modesty which is intended to be alluring; arch, coquettish, kittenish, skittish, withdrawn, timid, demure; reluctant to give details about something regarded as sensitive

		Arch: (a) deliberately or affectedly playful and teasing; mischievous, roguish, impish, devilish, naughty, frolicsome

		Affected: pretentious and designed to impress

		Frolic: (v) play or move about in a cheerful and lively way; gambol, cavort, caper, scamper, romp, prance, rollick, capriole, curvet; (n) playful and lively movement or activity; antic, caper, escapade, revel, spree, jape

		Porpoise: (n) a small toothed whale; (v) move through the water like a porpoise, alternatively rising above it and submerging

		Potemkin: having a false or deceptive appearance, especially one presented for the purpose of propaganda

		Romp: (v,n) (especially of a child or animal) play roughly and energetically; frolic, gambol, cavort, caper; proceed without effort (to achieve something); sail, coast; engage in sexual activity, especially illicitly; (n) a light hearted film or other work;

		Caper: (n,v) skip or dance in a lively or playful way; prance, jig, spring, hop, frolic; (n) an illicit or ridiculous activity or escapade (eg: I'm too old for this kind of caper); stunt, antics, mischief, jest, shenanigans, lark; a light hearted, far-fetched film, especially about crime

		Capriole: (n) a movement performed in classical riding, in which the horse leaps from the ground and kicks out with its hind legs; a leap or caper in dancing, esp. a capriole

		Jape: (n) a practical joke; (v) say or do something in jest or mockery

		Brazen: (a) bold and without shame; unabashed, presumptuous, impudent, impertinent, cheeky, brash; made of brass; harsh in sound; (v) endure an embarrassing or difficult situation by behaving with confidence and lack of shame (eg: brazen it out)

		Prim: (a) feeling or showing disapproval of anything regarded as improper; stiffly correct; puritanical, prissy, Victorian; square-toed, Grundyish; (v) purse (the mouth or lisp) into a prim expression

		Magniloquent: using high-flown or bombastic language; grandiose, ornate, rhetorical, oratorical, orotund, stilted, braggart, Falstaffian, fustian

		Humdrum: (a) lacking excitement or variety; boringly monotonous; mundane, dreary, dull, tedious, prosaic, repetitious, routine, pedestrian, run-of-the-mill; banausic; (n) monotonous routine; tedium

		Hackneyed: (of a phrase or idea) having been overused; unoriginal and trite; platitudinous, vapid, time-worn, banal, cliched, bromidic

		Vacuous: having or showing a lack of thought or intelligence; mindless, deadpan, inscrutable, glassy, lifeless, inane, dull-witted; empty

		Senseless: (of a person) unconscious; comatose, soporose, numb; lacking common sense; wildly foolish; asinine, moronic, fatuous, inane, daft, illogical, ludicrous, silly, absurd, idle, unavailing; (esp. of a violent or wasteful action) without discernible meaning or purpose

		Fatuous: silly and pointless; vacuous, asinine, puerile, foolish, infantile

		Madrigal: a part-song for several voices,  especially one of the Renaissance period, typically unaccompanied and arranged in elaborate counterpoint; anthem, carol, ballad, canzone, motet, hymn, psalm

		Incumbent: (a) necessary for (someone) as a duty or responsibility; (of an official regime) currently holding office; reigning; (of a company) having a sizable share of a market; (n) the older of an office or post

		Relent: abandon or mitigate a severe or harsh attitude, especially by finally yielding to a request; yield, accede, acquiesce, unbend, capitulate; become less severe or intense (eg: the rain relented); slacken, abate, subside, ease, diminish

		Stentorian: (of a person's voice) loud and powerful; stentorious, resonant, roaring, thunderous, strident, vibrant, sonorous, deafening, carrying

		Vindictive: having or showing a strong or unreasoning desire for revenge; grudge-bearing, acrimonious, bitter, spiteful, rancorous, baleful, malevolent

		Conceited: especially proud of oneself or vain; narcissistic, egotistical, egocentric, smug, supercilious, , haughty, vainglorious, peacockish, swaggering, strutting

		Conclave: a private meeting; (in the Roman Catholic Church) the assembly of cardinals for the election of a pope; the meeting place for a conclave

		Impugn: dispute the truth, validity, or honesty of (a statement or motive); call into question; take issue with, challenge

		Modus operandi: a particular way or method of doing something; procedure, methodology, formula, praxis; the way something operated or works

		Sibilance: a literary device where strongly stressed consonants are created deliberately by producing air through the lips and tongue, producing a hissing sound

		Glance: (v) take a brief or hurried look; peek, glimpse, catch a glimpse of, glance one's eye; read quickly or cursorily; hit something at an angle and bounce off obliquely; ricochet, be deflected, bounce, graze, cannon, carom, resile; (of light) reflect off something with a brief flash; gleam, glint, glitter, glisten, glimmer, sparkle, coruscate; (n) a brief hurried look

		Gentrify: renovate and improve (a house or district) so that it conforms to middle-class taste; make (someone or their way of life) more genteel

		Tribune: an official in Ancient Rome chosen by the plebeians to protect their interests; a popular leader, a champion of people's rights

		Rostrum: a raised platform on which a person stands to make a public speech, receive an award, or play music; a raised platform supporting a film or television camera; a beak-like projection, esp. a stiff snout or anterior prolongation of the head in an insect, crustacean, or cetacean (etymology: literally, 'beak', used in the plural rostra to describe the Forum in Rome, decorated with the beaks of captured galleys, which was used as a platform for public speakers

		Dais: a low platform for a lectern or throne

		Lectern: a talk stand with a sloping top to hold a book or notes

		Marshal: arrange (something) in proper order; set out in an orderly manner; arrange clearly (eg: to marshal facts; to marshal one's argument)

		Regalia: the emblems or insignia  of royalty, especially the crown, scepter, and other ornaments used at a coronation; the destinctive clothing worn and ornaments carried at formal occasions as an indication of status (eg: the bishop of Florence in full regalia)

		Victorian: relating to the attitudes and values of the reign of queen Victoria (1837-1901), characterized especially by prudishness and a high moral tone

		Pertinent: relevant; apropos, ad rem, appurtenant, apposite, germane

		Flaw: a mark, blemish, or other imperfection which mars a substance or object; foible, deficiency, shortcoming, shortfall; lack, kink, taint, crack, fissure, chip, scratch; a squall of wind, a short storm

		Wick: (n) a strip of porous material up which liquid fuel is drawn by capillary action to the flame in a candle, lamp or lighter; a gauze strip inserted in a wound to drain it; (v) absorb or draw off (liquid) by capillary action

		Pith: (n) the spongy white tissue lining the rind of oranges, lemons, and other citrus fruits; the spongy cellular tissue in the stems and branches of many higher plants; spinal marrow; the essence of something (eg: the pith and core); essence, quintessence, crux, gist, kernel, marrow; vigor and conciseness of expression; (v) remove the pith from; pierce of sever the spinal chord of (an animal) so as to kill or immobilize it

		Wilt: (v) (of a plant, leaf, or flower, become limp through heat, loss of water, or disease; droop, sag, flop, wither, shrivel (up); (of a person) lose energy, vigor, or confidence; languish, droop; leave (mown grass or a forage crop) in the open to dry partially before being collected for silage; (n) any bacterial or fungal disease characterized by wilting of the foliage

		Occlude: stop, close up, or obstruct (an opening, orifice, or passage; shut in; cover (an eye) to prevent its use; (with) (of a tooth) come into contact with another tooth in the opposite jaw; (of a solid) absorb or retain (a gas or impurity)

		Lodge: (n) a small house at the gates of a park or in the grounds of a large house; a branch or meeting place of an organization such as the Freemasons; a beaver's den; (v) present ( a complaint, appeal, claim, etc.) formally to the proper authorities; register, submit, lay, present, press, prefer, tender, proffer, file; leave money or a valuable item in (a place) or with (someone) for safekeeping; deposit, entrust, consign, store, stow, squirrel away; make or become firmly fixed or embedded in a place; wedge, embed, anchor, settle; rent accommodation in another person's house (eg: the man who lodged in the room next door); (of wind or rain) flatten (a standing crop)

		Salubrious: health-giving; healthy, wholesome; (of a place) pleasant; not run down; leafy, upmarket

		Apotropaic: supposedly having the power to avert evil influences or bad luck

		Triptych: a picture or relief carving on three panels, typically hinged together vertically and used as an altarpiece; a set of three associated artistic, literary, or musical works intended to be appreciated together

		Bethought: (archaic) (oneself) come to think

		Overwrought: in a state of nervous excitement or anxiety; tense, agitated, edgy, highly strung, neurotic, distraught, hysterical, jittery, fidgety; (of a piece of writing or a work of art) too elaborate or complicated in design or construction; overripe, overdone, florid, contrived, labored, baroque, rococo

		Begrimed: blackened with ingrained dirt

		Conscript: (v) enlist (someone) compulsorily, typically into the armed services; enlist, levy, muster, draft, recruit; (n) a person enlisted compulsorily

		Cower: crouch down in fear; cringe, shrink, recoil, flinch, shudder, shiver, shake, quake, grovel, blanch, quail

		Potentate: a monarch or ruler, esp. an autocratic one; tsar, sovereign, overlord, dynast, mogul

		Loll: sit, lie, or stand in a lazy, relaxed way; slop, lounge, sprawl, slouch, loaf, idle, vegetate; (of a part of the body) hang loosely; droop; (out) stick out (one's tongue) so that it hangs loosely out of the mouth; dangle, hang, dangle, driop, sag, flop

		Slop: (v) (of a liquid) spill over be spilled over the edge of a container, typically as a result of careless handling; (of a liquid) move within a container, noisily slapping against the sides; apply or pour (a liquid substance) in a casual or careless manner (eg: they slopped one paint); wade through (a wet or muddy area); dress or carry oneself in an untidy or casual manner; speak or write in a sentimentally effusive manner; gush (n) waste water from a kitchen, bathroom, or chamber pot that has to be emptied by hand; unappetizing semi-liquid food; sentimental language or material; a choppy sea

		Aesthete: a person who is appreciative of and sensitive to art and beauty

		Moulder: slowly decay or disintegrate, especially because of neglect; decompose, rot, spoil, putrefy, crumble, deteriorate

		Garish: obtrusively bright and showy; lurid, gaudy, brassy, glittering, brash, vulgar, glaring

		Shrill: (a) (of a voice or sound) high-pitched and piercing; strident, shattering, shrieking, screeching; (especially of a complaint or demand) loud and forceful (v) make a shrill noise; (n) a shrill sound or cry

		Wheeze: (v) breathe with a whistling or rattling sound in the chest, as a result of obstruction in the air passages; gasp, rasp, croak; (out) say (something) with a wheezing sound; walk or move slowly making a wheezing sound; (of a device) make an irregular rattling or spluttering sound; (n) a wheezing sound

		Preternatural: beyond what is normal or natural; miraculous, wondrous, unworldly, anomalous, peculiar

		Undergird: secure or fasten from the underside, especially by a rope or chained passed underneath; provide support or a firm basis for

		Springy: elastic, tensile, whippy; (of movements) light and confident; jaunty, sprightly, buoyant

		Sputter: (v) make a series of soft explosive or spitting sounds; speak in a series or incoherent bursts as a result of strong emotion; proceed in a spasmodic and feeble way; coat (a surface) with a spray of metal particles emitted from a target which is bombarded with fast ions; (n) a series of soft explosive or spitting sounds

		Incandescent: emitting light as a result of being heated; red-hot, fiery, blazing, ablaze, aflame, glowing, aglow; luminous, gleaming, fervid, fervent, ardent, rutilant, lucent, candescent; (of an electric light) containing a filament which flies white-hot when heated by a current passed through it; full of strong emotion; passionate; extremely angry; incensed, irate, wrathful, apoplectic, wild, aerated, wroth

		Purport: appear to be or do something, especially falsely; impersonate, pretend; (n) the meaning or sense of something, typically a document or speech; the purpose or intention of something

		Flit: (v) move swiftly and lightly; dart, dash, flutter, bob, spring, gambol, caper, cavort, prance; (v,n) (British) move house or leave one's home so as to escape creditors or obligations

		Daze: (v) (esp. of an emotional or physical shock) make (someone) unable to thing or react properly; stupefy, astound, astonish, dumbfound, dismay, disconcert, stagger, confound, bewilder, nonplus, flabbergast; (n) a state of stunned confusion or bewilderment; stupor, haze, whirl, dwam

		Overture: an orchestral piece a the beginning of an opera, play, etc.; prelude, voluntary, verset; an introduction to something more substantial; harbinger, herald, curtain-raiser, preliminary; an approach or proposal made to someone with the aim of opening negotiations or establishing a relationship; move, approach, pass

		Eaves: the part of a roof that meets or overhangs the walls of a building

		Prop: (n) a pole or beam used as a temporary support or to keep something in position; stanchion, shaft, buttress, beam, pier, pillar, bolster, point d'appui; a person or thing that is a major source of support and assistance; cornerstone, backbone, anchor; a word used to fill a syntactic role without any specific meaning of its own, for example 'it' in "it is raining"; (v) support or be kept in position; lean (something) against something else

		Consort: (n) a wife, husband, or companion, in particular the spouse of a reigning monarch; a ship sailing in company with another; (v)?habitually associate with (someone), typically with the disapproval of others; associate, rub shoulders/elbows; agree or be in harmony with

		Leaven: (v,n) a substance, typically yeast, that is added to dough to make ferment and rise; a pervasive influence that modifies something or transforms it for the better

		Lump: a compact mass of a substance, esp. one without a definite or regular shape; clod, mound; a small cube of sugar; (v) (together) put an indiscriminate mass or group; treat as alike without regards for particulars; conglomerate, coalesce, blend, fuse, bunch, aggregate

		Subsume: include or absorb (something) in something else (eg: they can be subsumed under two broad categories)

		Circumspect: wary and unwilling to take risks; cautious, chart, heedful, vigilant, prudent, judicious, canny

		Girdle: (n) a belt or cord worn round the waist; cummerbund, girth, waistband, baldric, ceinture, cestus; a thing that encircles something like a girdle; either of the two sets of bones encircling the body, to which the limbs are attached; a woman's elasticated corset extending from waist to thigh; the part of a cut gem dividing the crown from the base and embraced by the setting; a ring made around a tree by removing bark (v) encircle (the body) with a girdle; surround; encircle, gird; cut through the bark all the way round (a tree or branch) typically in order to kill it

		Multifarious: many and of various types; having many varied parts or aspects; diverse, various, multitudinous, manifold, multifaceted, eclectic, variegated, myriad, divers

		Thud: (n) a dull, heavy sound, such that as made by an object falling to the ground; thump, crash, smash, thunder, stomp; (v) move, fall, or strike something with a dull, heavy sound; used to emphasize the clumsiness or awkwardness of something

		Mesh: (n) material made of a network of wore and thread; web, webbing, net, netting, lattice; the spacing between the individual stands that form mesh; used as a reference to a complex or constricting situation; (v) (of the teeth of a gearwheel) be engaged with another gearwheel; interlock; make of become entangled or entwined; be in or being into harmony; dovetail, harmonize, coordinate

		Beget (begot/begat, begotten): (especially of a man) bring (a child) into existence by the process of reproduction; father, sire; cause, bring about; give rise to, produce, induce, trigger, provoke, kindle, enkindle, engender, precipitate, prompt, spark off, effect

		Penumbra: the partially shaded outer region of the shadow cast by an opaque object; the shadow cast by the earth or moon over an area experiencing a partial eclipse; a peripheral or indeterminate area or group (eg: a penumbra of theories

		Umbra (plu: umbrae): the fully shaded inner region of a shadow cast by an opaque object, especially the area on the earth or moon experiencing the total phase of an eclipse; the dark central part of a sunspot; shadow or darkness

		Snug: (a) comfortable, warm, and cosy; well protected from the weather or cold; congenial, sheltered, homely; (of an income or employment) allowing one to live in comfort and comparative ease; very tight and close-fitting; figure-hugging, skintight, sheath; (v) place (something) safely or cosily; settle comfortably and cosily

		Din: (n) a loud, unpleasant, and prolonged noise; uproar, racket, commotion, cacophony, tumult, clangour, clatter, babble, clamor, brouhaha, fuss, pandemonium, bedlam, vociferation, ululation, ado; (v) (into) make (someone) learn or remember an idea by constant repetition; ingrain, inculcate, hammer, drill, instill, indoctrinate; make a loud, unpleasant, and prolonged noise; blare, clamor, bay, bellow

		Assent: (n,v) the expression of approval or agreement; mandate, authorize, back, validate, license, warrant; (n) official agreement or sanction (eg: the royal assent); acquiescence, approbation, imprimatur, consent, blessing

		Beckon: (to) make a gesture with the hand, arm, or head, to encourage or instruct someone to approach or follow; summon (someone) by beckoning to them; appear attractive or inviting; entice, lure, charm, allure, engage, enchant, captivate, persuade, induce

		Beacon: a fire or light set up in a high or prominent position as a warning, signal, or celebration; a radio transmitter whose signal helps to fix the position of a ship, aircraft, or spacecraft.

		Berth: (n) a ship's allotted place at a wharf or dock; anchorage, mooring; a fixed bunk on a ship, train, or other means of transport; (v) moor (a ship) in its allotted place; (of a ship) dock; (of a passenger ship) provide a sleeping place for (someone)

		Emboss: carve, mould, or stamp a design on (a surface or object) so that it stands out in relief; carve, mould, or stamp (a design)

		Peer: look with difficulty or concentration at someone or something; squint, peek, pry, gawp, gaze, stare, gape, contemplate; be just visible (eg: the towers peered over the roof)

		Renege: go back on a promise, undertaking, or contract; default on, fail to honor, retreat from, welsh on, repudiate, backtrack on; renounce or abandon;

		Acrostic: a poem, puzzle, or other composition in which certain letters in each line form a word or words

		Falstaffian: relating to or resembling Shakespeare's character Sir John Falstaff in being fat, jolly, and debauched

		Soporose: (of an illness) characterized by abnormally deep sleep

		Banausic: not operating on an elevated level, mundane and banal; relating to technical work (etymology: of or for artisans)

		Gist: the substance or general meaning of a speech or text; quintessence, pith, narrow, crux, thrust, drift, core, kernel; (law) the real point of an action

		Vainglorious: (of a person) excessively boastful, having a swelled pride, often annoying to be around. (From vainglory: worthless glory)

		Supercilious: behaving or looking as though one thinks one is superior to others; haughty, conceited, disdainful, imperious, condescending, pretentious, affected

		Aerated: (a) (of a liquid) made effervescent by being charged with carbon dioxide or some other gas; (v) (aerate) introduce air into (a material)

		Diatribe: a forceful and bitter verbal attack against someone or something; tirade, harangue, obloquy, verbal onslaught, fulmination, stricture, admonition, invective, vituperation, philippic

		Shim: (n) a washer or thin strip of material used to align parts, make them fit, or reduce wear; (v) (up) wedge (something) or fill up (a space) with a shim

		Praxis: practice, as distinguished from theory; accepted practice or custom (eg: patterns of Christian praxis in society)

		Ere: (archaic) before (in time)

		Pejorative: (a, n) expressing contempt or disapproval; disparaging, derogatory, deprecatory, libelous, vituperative

		Resile: (from) abandon a position or course of action

		Germane: relevant to a subject under consideration; apropos, ad rem, analogous, apposite, pertinent

		Ad rem: to the matter

		Suspire: breathe; (Middle English) yearn after

		Contrive: create or bring about (an object or a situation) by deliberate use of skill and artifice; orchestrate, manufacture, devise, concoct, plot, hatch; manage to do something foolish or create an undesirable situation; compass

		Hoary: grayish white; (of a person) old and having grey or white hair; overused and unoriginal; trite, hackneyed, banal, platitudinous, prosaic, pedestrian, run-of-the-mill

		Carom: (n) a cannon in billiards or pool; (v) make a carom; strike and rebound (abbreviation of carambole)

		Tinge: (v) (with) color slightly; tint, due, stain, shade, suffuse, flush, impregnate; permeate or imbue slightly with a feeling or quality; (n) a trace of color; a slight trace of a feeling or quality

		Apposite: apt in the circumstances or in relation to something; germane, congruous, felicitous, ad rem, appurtenant

		Puerile: childishly silly and immature

		Defenestration: (humorous) the action of throwing someone out of a window; the action or process of dismissing someone from a position of power or authority

		Kink: (n) a sharp twist or curve in something that is otherwise straight (eg: your fishing line should have no kinks or frays; kink in the road); a flaw or obstacle in a plan, operation, etc.; a quirk of character; a person's unusual sexual preference; form or cause to form a sharp twist or curve

		Pyre: a heap of combustible material, especially one for burning a corpse as part of a funeral ceremony

		Consternation: a feeling of anxiety or dismay, typically at something unexpected; trepidation, discomposure, disquietude, disquiet, angst, distress

		Inoculate: (against) treat with a vaccine to produce immunity against a disease; vaccinate; (into) introduce (an infective agent)  into an organism or culture medium

		Languish: (of a person, animal, or plant) lose or lack vitality; grow weak; wither, wilt, decline; fail to make progress or be successful; (after) pine with love or grief; assume a sentimentally tender or melancholy expression or tone; (in) be forced to remain in an unpleasant place or situations; rot, decay, molder, waste away, wither away

		Epigram: a pithy saying or remark expressing an idea in a clever and amusing way; quip, witticism, jest, bon mot, jeu d'esprit, equivoque, paronomasia; aphorism, maxim, adage, gnome, epigraph, apophtegm

		Grapple: (v) engage in a close fight or struggle without weapons; wrestle, tussle, scuffle; seize hold of (someone) (eg: grapple around the throat); struggle to deal with or overcome (a difficulty or challenge); seize or hold with a grappling hook; (n) an act of grappling; a grappling hook

		Abet: encourage or assist (someone) to do something wrong, in particular commit a crime; encourage someone to commit (a crime)

		Shunt: (v) push or pull (a train or part of a train) from the main line to a siding or from one line of rails to another; push or shove (someone or something); divert or direct to a less important place or position; provide (electrical current) with a conductor joining two points of a circuit, through which more or less of the current may be diverted; for instance to avert a short circuit; (n) an act of pushing or shoving something

		Scaffold: (n) a raised wooden platform used formerly for the public execution of criminals; a structure made using scaffolding; (v) attach scaffolding to a building

		Sprawl: (v,n) sit, lie, or call with one's arms and legs spread out in an ungainly way; lounge, loll, be prostrate, be supine, slump, slouch; spread out over a large area in an untidy or irregular way; stretch, straggle; (n) the disorganized and unattractive expansion of an urban or industrial area into the adjoining countryside

		Adjoin: be next to and joined with (a builder, room, or piece of land); neighbor, border (on), abut, be contiguous with, bound on, extend to, vicinal

		Straggle: (v) (of an irregular group of people) move along slowly so as to remain some distance behind the person or people in front; dawdle, trail, drift; grow, spread, of be laid out in an irregular, untidy way; (n) an untidy it irregularly arranged mass or group

		Compass: (n) the range or scope of something (eg: beyond the compass); the enclosing limits of an area; the range of notes that can be produced by a voice or a musical instrument; (v) go round (something) in a circular course; surround or hem in on all sides; contrive to accomplish (something)

		Luddite: a member of any of the base of English workers who destroyed machinery, especially in cotton and woolen mills, which they believed was threatening their jobs (1811-16); a person opposed to increased industrialization or new technology

		Welsh: (on) fail to honor (a debt or obligation incurred through a promise or agreement)

		Quail: (v) feel or show fear or apprehension; waver, falter, flinch, shudder, shiver, quake

		Knead: work (moistened flour or clay) into dough or paste with the hands; make (bread or pottery) by kneading flour or clay; massage or squeeze with the hands

		Palpate: examine (a part of the body) by touch, especially for medical purposes;

		Happenstance: coincidence

		Watermark: (n) a faint design made in some paper during manufacture that is visible when held against the light and typically identifies the maker; (v) mark (paper) with a watermark

		Truss: (n) a framework, typically consisting of rafters, posts, and struts, supporting a roof, bridge, or other structure; joist, shore; a surgical appliance worn to support a hernia, typically a padded belt; a compact cluster of flowers or fruit growing on one stalk (v) tie up the wings and legs of (a chicken or other bird) before cooking; (up) tie up (someone) with their arms at their sides; fetter, pinion, tether; (up) dress (someone) in elaborate or uncomfortable clothing; support (a roof etc.,) with a truss or trusses

		Pinion: (n) the outer part of a bird's wing including the flight feathers; a bird's wing as used in flight; (v)  restrain or immobilize (someone) by tying up or holding their arms or legs; tie up or hold (the arms or legs) of a person; cut off the pinion of (wing or bird) to prevent flight

		Shore: (n) a prop or beam set obliquely against something weak or unstable as a support; (v) (up) support or hold up something with props or beams; buttress, brace, truss, underpin, bolster up; support or assist something that would otherwise fail or decline

		Repartee: conversation or speech characterized by quick, witty comments or replies; badinage, persiflage, sallies, ripostes, patter, banter

		Patter: (v) make a repeated light tapping sound; pulsate, thrum, tap, rattle; run with quick steps; scurry, scuttle; (on) talk at length without saying anything intelligent; prattle, ramble,  blather, drivel; (n) a repeated light tapping; rapid continuous talk, such as that used by a comedian of salesperson; prattle, blather, babble, jabber; the jargon of a profession or social group; vernacular, parlance, argot

		Scurry: (v) (of a person or small animal) move hurriedly with short quick steps; scamper, dash, bustle; (n) a situation of hurried and confused movement; a flurry of rain or snow

		Bustle: (v) move in an energetic and busy manner; dash, scurry, rush, scamper, flutter, fuss; whizz, buzz, hare, zoom, beetle; cause to move hurriedly in a particular direction; (of a place) be full of activity; hectic, lively, vibrant, astir; (n) excited activity and movement; animation, commotion, flurry, tumult, agitation, hustle and bustle; a pad or frame worn under a skirt and puffing it out behind

		Fuss: (v) show unnecessary or excessive concern about something; fret; take pains; busy oneself restlessly; bustle; disturb or bother (someone); treat (someone) with excessive attention or affection

		Astir: in a state of excited movement; awake and out of bed

		Scuttle: (n) a metal container with a handle, used to fetch and store coal for a domestic fire; the amount of coal held in a scuttle; an act or sound of scuttling; an opening with a cover in a ship's deck or side; (v) run hurriedly or furtively with short quick steps; scamper, scurry, scramble, bustle; sink (one's own ship) deliberately by holing it or opening its seacocks to let water in; deliberately cause (a scheme) to fail

		Scamper: (v,n) (especially of a small animal or child) run with quick light steps, esp. through fear or excitement

		Flurry: (n) a small swirling mass of something, esp. snow or leaves, moved by sudden gusts of wind; swirl, eddy, whirl, billow, gust, gale, squall; a sudden short period of activity or excitement; a number of things arriving or happening suddenly and during the same period; (v) (especially of snow or leaves) be moved in small swirling masses by sudden gusts of wind; (of a person) move quickly in a busy or agitated way

		Maelstrom: a powerful whirlpool in the sea or a river; a situation or state of confused movement or violent turmoil; disarray, chaos, turbulence, tumult, pandemonium, bedlam, seething mass, upheaval

		Disarray: (n) a state of disorganization or  untidiness; (v) throw into a state or disorganization or untidiness; undress (someone)

		Badinage: humorous or witty conversation

		Persiflage: light and slightly contemptuous mockery or banter

		Banter: (v,n) exchange remarks in a good-humored, teasing way

		Strait: (n) a narrow passage of water connecting two seas or two other large areas of water; used in reference to a situation characterized by a specified degree of trouble or difficulty; (a) (of a place) of limited spatial capacity; narrow or cramped; close, strict, or rigorous

		Bludgeon: (n) a thick stick with a heavy end, used as a weapon; beat (someone) repeatedly with a bludgeon or other heavy object; force or bully (someone) to do something; hector, badger, coerce, dragoon; make one's way by brute force

		Mellow: (a) (especially of a sound, flavor, or color) pleasantly smooth or soft; free from harshness; dulcet, tuneful, euphonious, mellifluous; (of wine) well-matured and smooth; (of fruit) ripe, sweet, and juicy; (of a person's character) tempered by maturity or experience; relaxed and good-humored; affable, gracious, amiable, amicable; relaxed and cheerful through being slightly drunk; (or earth) rich and loamy; (v) make or become mellow; calm, settle, mature, season, condition

		Loam: (n) (adj: loamy) a fertile soil of clay and sand containing humus; a paste of clay and water with sand, chopped straw, etc., used in making bricks and plastering walls

		Euphonious: (of sound, especially speech) pleasing to the ear; melodious, harmonious, canorous, dulcet, honeyed, lyrical, silvery, mellow

		Wondrous: inspiring a feeling of wonder or delight; marvelous

		Innocuous: not harmful or offensive; anodyne, insipid, mild, unremarkable, unobjectionable

		Ado: a state of agitation or fuss; upset, commotion, stir, hubbub, tumult, confusion, hurly-burly, palaver, rigmarole, brouhaha, furore, tamasha, pantomime, kerfuffle, rumpus, fuss and feathers

		Rigmarole: a lengthy and complicated procedure; a long, rambling story or statement

		Hurly-burly: busy, boisterous activity; bustle, chaos, pandemonium, bedlam, brouhaha, upheaval, unrest, agitation

		Induce: succeed in persuading or leading (someone) to do something; persuade, convince, inspire, prompt, instigate, impel, urge, incite, cajole into, wheedle into, coax into, prod into; bring about or give rise to; engender, originate, occasion, set in motion, trigger off, spark off, whip up, stir up, kindle, arouse, foster, beget, effectuate; derive by inductive reasoning

		Impel: drive, force, or urge (someone) to do something; compel, require, exhort, goad, spur, prod, prompt; drive forward; propel

		Exhort: strongly encourage or urge (someone) to do something; adjure, goad, admonish, beseech, implore

		Beseech: ask someone urgently and fervently to do or give something; implore, importune, plead with, exhort, supplicate, adjure

		Importune: harass (someone) persistently for it to do something; beseech, solicit, supplicate, pester, beset, badger, torment, hound, harp on at, mither, dun, obsecrate; approach (someone) to offer one's services as a prostitute; accost

		Hound: (n) a dog of a breed used for hunting, especially one able to track by scent; a person eagerly seeking something (v) harass, persecute, or pursue relentlessly

		Bedevil: (of something bad) cause great and continual trouble to; (of a person) torment or harass; afflict, torment, assail, beset, plague, blight, harrow

		Assail: make a concerted or violent attack on; besiege, pounce on, storm; (of an unpleasant feeling it physical sensation) come upon (someone) suddenly and strongly; criticize strongly; castigate, chastise, berate, lambaste, lash, pillory, revile, excoriate, reprehend

		Pillory: (n) a wooden framework with holes for the head and hands, in which offenders were formerly imprisoned and exposed to public abuse; (v) put (someone) in a pillory; attack or ridicule publicly; lambaste, flay, crucify, slate, pummel, excoriate; ridicule, deride, sneer at, jeer at, chaff

		Flay: strip the skin off (a corpse or carcass); strip (the skin) off a corpse or carcass; whip or beat (someone) so harshly as to remove their skin; criticize severely or brutally

		Belabor: attack (someone) physically or verbally; argue or discuss (a subject) in excessive detail; dwell on, harp on about

		Chaff: the husks of corn or other seed separated by winnowing or threshing; chopped hay and straw used as fodder; worthless things; rubbish; strips of metal foil released in the air to obstruct radar detection; light hearted joking; banter, repartee, raillery, badinage, persiflage, witticism, sallies, quips; (v) tease; taunt, jibe at, bait, goad

		Goad: (v) provoke or annoy (someone) so as to stimulate an action or reaction; prod, provoke, rouse, dragoon, inflame, excite, impel; drive (an animal) with a spiked stick; (n) a spiked stick used for driving cattle; a thing that stimulates someone into action; stimulus, incentive, impetus, impulse, spur, prod

		Dragoon: (n) a member of any of several cavalry regiments in the British army; (v) (into) coerce (someone) into doing something

		Berate: scold or criticize (someone) angrily

		Lambaste: criticize (someone or something) harshly; castigate, chastise, harangue, revile, fulminate against, haul/call over the coals, upbraid, chide, admonish

		Chastise: rebuke or reprimand severely; punish, especially by beating

		Fulminate: (against) express vehement protest; rail, rage, rant, thunder, storm, inveigh, decry, arraign, animadvert, vituperate, vociferate about; explode violently or flash like lightning; (of a disease or symptom) develop suddenly and severely

		Arraign: call or bring (someone) before a court to answer a criminal charge; indict, inculpate; find fault with; censure; pillory, lambaste, berate, admonish, excoriate, objurgate

		Upbraid: find fault with (someone); scold

		Chide: scold or rebuke; scold, chastise

		Admonish: reprimand firmly; upbraid, chide, rebuke, scold, lambaste, chastise, lecture, give (someone) a dressing-down, lay into, lace into; advise or urge (someone) earnestly; beseech, enjoin, adjure; warn (someone) of something to be avoided

		Blight: (n) a plant disease, typically one caused by fungi such as mildews, rusts, and smuts; a thing that spoils or damages something; affliction, scourge, bane, curse, plague, misfortune, woe, tribulation, cancer, canker, nuisance, pest; the degeneration of a landscape or urban area as a result of neglect; (v) infect (plants) with blight; spoil, harm, destroy; wreck, ruin, mar, play havoc with, frustrate, quell, stymie; subject (an urban area) to neglect

		Scourge: (n) a whip used as an instrument of punishment; a person or thing that causes great trouble or suffering; (v) whip (someone) as a punishment; flog, lash, flagellate, birch, cane, thrash, lather; cause great suffering to; bedevil, beset, burden, plague, torment

		Tribulation: a cause or state of great trouble or suffering; misfortune, tragedy, distress, wretchedness, woe, agony

		Harrow: (n) an implement consisting of a heavy frame set with teeth or tines which is dragged over ploughed land to break up clods, remove weeds, and cover seed; (v) draw a harrow over (land); cause distress to; appalling, heart-rending, tragic

		Dun: (a) of a dull, greyish-brown color; dark or dusky; (n) a dull greyish-brown color; a kind of horse; a subadult mayfly, which has drab coloration and opaque wings

		Supplicate: ask or beg for something earnestly or humbly; beseech, implore, importune

		Adjure: urge or request (someone) solemnly or earnestly to do something

		Occasion: (n) reason; cause (eg: it's the first time I've had occasion to complain); (v) cause (something); prompt, elicit, arouse, trigger, beget

		Bewilder: cause (someone) to become perplexed and confused; baffle, mystify, bemuse, perplex, nonplus, disconcert, confound, discombobulate, faze, obfuscate, convoluted, unfathomable, impenetrable, Byzantine, daedalian, Gordian, labyrinthine, intricate

		Bemuse: (as adj.) puzzle, confuse, or bewilder; fuddled, befuddled, muddled, dumbfounded, discomposed, taken aback, stunned, dazed, astonished, at sea, stupefied

		Fuddled: confused or stupefied, especially as a result of drinking alcohol; addled, muddled, foggy, vague, dizzy, muzzy

		Befuddle: cause to become unable to think clearly

		Addle: (humorous) make (someone) unable to think clearly; confuse (eg: being in love must have addled your brain; (of an egg) become rotten, producing no chick

		Muddle: (up) bring into a disordered or confusing state; confuse (a person or their thoughts); (about) busy oneself in an aimless or ineffective way; mix (a drink) or stir (an ingredient) into a drink

		Foggy: full of or characterized by fog; unable to think clearly, confused; indistinctly expressed or remembered, obscure

		Bleary: (of the eyes) looking or feeling dull and unfocused from sleep or tiredness

		Rheumy: (especially of the eyes) full of rheum (a watery fluid that collects I'm or drips from the nose or eyes); watery

		Muzzy: unable to think clearly, confused; not thought out clearly, vague (eg: society's muzzy notion of tolerance); blurred, indistinct (eg: a muzzy picture)

		Daedalian: ingenious, intricate, and confusing (from Daedalus, father of Icarus and considered the inventor of carpentry, built a labyrinth for Minos)

		Labyrinthine: (of a network) like a labyrinth, irregular and twisting; serpentine, sinuous, mazy, wandering, meandering, winding, tortuous; (of a system) intricate and confusing; Byzantine, tortuous, inextricable, daedalian, involuted, bewildering

		Tortuous: full of twists and turns; sinuous, serpentine, convoluted, anfractuous, flexuous; excessively lengthy and complex (eg: a tortuous argument)

		Involute: involved or intricate; curled spirally; (of a shell) having the whorls wound closely round the axis; (of a leaf or the cap of a fungus) rolled inwards at the edges

		Aglow: glowing

		Dudgeon: (in high dudgeon) offended or resentful

		Peculiar: different to what is normal or expected, strange; odd, bizzare, curious, uncanny, queer, atypical, eccentric, idiosyncratic, offbeat, outlandish, quirky, quaint, droll, zany; slightly and undeniably unwell; indisposed, queasy, nauseous, liverish, out of sorts; particular, special; individual, specific, conspicuous, belonging exclusively to; typical of, symptomatic of, characteristic of

		Idiosyncrasy: a mode of behavior or way I thought peculiar to an individual; a distinctive or peculiar feature or characteristic

		Zany: (a) amusingly unconventional and idiosyncratic; off-center, avant-grade, ludicrous, comical, farcical, outlandish, eccentric, bizzare; (n) a zany person; a comic performer partnering a clown, whom he imitated in an amusing way (Giovanni in comedia dell'arte)

		Liverish: slightly ill, as though having a disordered liver; resembling liver in color

		Blanch: make pale or white by extracting color; blench, etiolate, decolorize, bleach; grow/turn pallid; whiten (a plant) by depriving it of light; flinch or grow pale from shock, fear, or similar emotion; start, shrink, cringe, wince, quiver, shudder, shiver, quail, cower, waver, falter prepare (vegetables) for freezing or further cooking by immersing briefly in boiling water; peel (almonds) by scalding them

		Salutary: (especially with reference to something unwelcome or unpleasant) producing good effects, beneficial; health-giving; salubrious, wholesome

		Prefer: like (one thing or person) better than another or others, tend to choose; submit (a charge or piece of information) for consideration; lodge, lay, submit, proffer; promote or advance (someone) to a prestigious position; aggrandize, elevate

		Silage: (n) grass or other green fodder compacted and stored in airtight conditions, typically in a silo, without first being dried, and used as animal feed in the winter; (v) make silage; preserve (grass and other green forget as silage

		Silo: (n) a tall tower or pit on a farm to store grain; an underground chamber in which a guided missile is kept ready for firing; a system, process, department, etc. that operates in isolation from others; (v) isolate (a system, dept, etc.) from others

		Paranomasia: a play on words; a pun

		Brim: (n) the projecting edge around the bottom of a hat; the upper edge or lip of a cup, bowl, or other container; rim, brink; (v) be full to the point of overflowing; fill something so completely that it almost overflows; be full of a particular quality, feeling, etc.

		Autochthonous: (of an inhabitant of a place) indigenous rather than descended from migrants or colonists; (of a deposit or formation) formed in its present position

		Harangue: (n) a lengthy or aggressive speech; tirade, diatribe, polemic, rant, fulmination, invective, exhortation, peroration, obloquy, philippic, declamation, homily; (v) lecture (someone) at length in an aggressive and critical manner; pontificate, berate, castigate, lambaste, pillory, upbraid, sermonize

		Philippic: (n) a bitter attack or denunciation, especially a verbal one

		Crux: the decisive or most important point at issue; pith, core, essence, heart; a particular point of difficulty

		Fray: (v) (of a fabric, rope, or cord) unravel or become worn at the edge; typically through constant rubbing; wear, unravel, become threadbare, become tattered, become ragged; wear thin/away; moth-eaten, shabby; (of a person's nerves or temper) show the effects of strain; edgy, fraught, strained; (of a male deer) rub (a bush or small tree) with the head in order to remove the velvet from newly formed antlers, or to mark territory during the rut; (n) a situation of intense competitive activity (eg: join in the fray); a battle or fight; skirmish, tussle, altercation, scuffle, brawl, melee

		Rut: (n) a long deep track made by the repeated passage of the wheels of vehicles; furrow, groove, trough, gutter, trench, ditch; a habit or pattern of behavior that has become dull and unproductive but is hard to change (eg: in a rut); an annual period of sexual activity in deer and some other mammals, during which the males fight each other for access to the females; (v) (of a deer or other mammal) engage in the rut

		Shabby: in poor condition through long use or lack of care; scruffy, neglected, dilapidated, dingy, insalubrious, squalid, sordid, wretched; threadbare, mangy, frayed, tattered, decrepit, falling apart at the seams, dowdy; dressed in old or worn clothes; (of behavior) mean and unfair; contemptible, despicable, ignoble, shoddy, sorry

		Skirmish: (n)an episode of irregular or unpremeditated fighting, especially between small or outlying parts of armies or fleets; a short argument; (v) engage in a skirmish

		Tussle: (n) a vigorous struggle or scuffle, typically in order to obtain or achieve something; (v) engage in a vigorous struggle or scuffle; grapple, brawl, wrestle, scrimmage

		Pertain: (v) be appropriate, related, or applicable to; be in effect or existence in a specified place or at a specified time; be the order of the day, prevail

		Lattice: a structure consisting of strips of wood of metal crossed and fastened together with square or diamond shaped spaces left between, used as a screen or fence of as a support for climbing plants; grate, grid, trellis, mesh, reticulum, grille, espalier, plexus, filigree; an interlaced structure or pattern resembling a lattice

		Trellis: (n) a framework of light wooden or metal bars used as a support for fruit tress, typically fastened against a wall; (v) provide with or enclose in a trellis; support (a climbing plant) with a trellis

		Reticulate: (v) divide or mark (something) in such a way as to resemble a net or network; (as: reticulated) (of porcelain) having a pattern of interlacing lines forming a net or web

		Espalier: (n) a fruit tree or ornamental shrub whose branches are trained to grow flat against a wall, supported on a lattice; a lattice for an espaliered tree or shrub; (v) train (a tree or shrub) to grow flat against a wall

		Grate: (v) reduce (food) to small shreds by rubbing it on a grater; shred, grind, pulverize, crush, crumble, mah, macerate, triturate; make an unpleasant, rasping sound; screech, creak, squeak, jar, scrape; say something in a harsh tone; (on) have an irritating effect; jar, irk, exasperate, peeve, nettle, rankle, chafe, fret, rile, aggravate

		Nettle: (n) a herbaceous plant which has jagged leaves covered with stringing hairs (French: ortie); (v) irritate or annoy (someone); vex, annoy, gall, provoke, upset, disgruntle, rankle, chafe; sting with nettles

		Macerate: (especially with reference to good) soften or become softened by soaking in a liquid; soak, steep, infuse

		Steep: (a) (of a slope, flight of stairs, or angle) rising or falling sharply, almost perpendicular; vertiginous, precipitous, abrupt, sharp, sheer, bluff, declivitous, acclivitous; (of a claim or account) exaggerated or incredible; (n) a steep mountain slope; (v) soak (food or tea) in water or other liquid so as to extract its flavor or to soften it; marinade, marinate, soak, souse, macerate, pickle, brine; soak or saturate (cloth) in water or other liquid; soak, immerse, submerge, drench, saturate; surround or fill with a quality or influence

		Sheer: (a) nothing other than; unmitigated (used for emphasis); utter, complete, absolute, pure, thorough, through and through, consummate, unalloyed, stark, rank, mere; (especially of a cliff or wall) perpendicular or nearly so; (of a fabric) very thin; diaphanous, gossamer, floaty, gauzy, filmly, insubstantial; (adv) perpendicularly (eg: the ridge fell sheer); (n) a very fine or diaphanous fabric or article; a sudden deviation from a course, especially by a boat; the upward slope of a ship's lines towards the bow and stern (v) (off) (typically of a boat) swerve or change course quickly; (away) avoid or move away from an unpleasant topic; recoil, shy away, avoid

		Unalloyed: (of metal) pure; (chiefly of emotions) complete and unreserved

		Stark: severe or bare in appearance or outline; crisp, distinct, clear-cut; bare, desolate, barren, arid, forsaken, godforsaken, bleak, dreary, gloomy, sombre, grim, drear; austere, unadorned, unembellished; unpleasantly or sharply clear; blunt, harsh, unvarnished; complete, sheer; utter, absolute, unequivocal, unalloyed, unmitigated; completely naked; stiff, rigid, or incapable of movement, catatonic, (eg: a human body lying stiff and stark); physically strong or powerful

		Varnish: (n) resin dissolved in. Liquid for applying in wood, metal, or other materials to form a hard, clear, shiny surface when dry; lacquer, shellac, glaze, polish; an external or superficially attractive appearance of a specific quality; (v) apply varnish to

		Lacquer: (n) a chemical substance sprayed on hair to keep it in place; the Sao of lacquer tree used as varnish; decorative wooden articles coated with lacquer; (v) coat with lacquer; spray (the hair) with lacquer

		Glaze: (v) fit panes of glass into (a window or door frame or similar structure); (in) enclose or cover with glass; overlay or cover (food, fabric, etc.) with a smooth, shiny coating or finish; (especially of the eyes) lose brightness and animation; become glassy, mist over; (n) a vitreous substance fused on the surface of pottery to form an impervious decorative coating

		Rank: (n) a position within the hierarchy of an organization or society; high social position; a single line of soldiers or police officers drawn up abreast; the people belonging to or constituting a group or class; (v) give (someone or something) a rank or place within the grading system; take precedence over (someone) in respect of rank; outrank; arrange in a row or rows; (a) (of vegetation) growing too thickly and coarsely; abundant, luxuriant, dense, profuse, flourishing, exuberant, vigorous; having a foul or offensive smell; noxious, fetid, rancid, putrid, malodorous, fusty, musty, stale, miasmic, mephitic, noisome, olid; (especially of something bad or deficient) complete and utter (used for emphasis)

		Exuberant: full of energy, excitement, and cheerfulness; ebullient, buoyant, jaunty, breezy, euphoric, effervescent, vivacious, vigorous, gladsome, blithe; characterized by a vigorously imaginative art style; growing luxuriantly or profusely; lush, abounding, copious, prolific, teeming, thriving, flourishing, verdant

		Blithe: showing a casual and cheerful indifference considered to be callous or improper; heedless, unconcerned, blasé, nonchalant; happy or carefree; jolly, joyous, blissful, beatific, elated, mirthful, jocund

		Beatific: feeling of expressing blissful happiness; seraphic, rapturous, blissful, serene, beaming; imparting holy bliss; exalted, rapt

		Abounding: very plentiful; abundant, copious, ample, lavish, boundless, munificent, galore, plenteous; (with) have in large numbers or amounts; overflow with, teem with, be thronged with, bristle with, be thick with, swarm with

		Munificent: characterized by or displaying great generosity; magnanimous, philanthropic, lavish, unstinted, bounteous

		Galore: in abundance; aplenty, to spare

		Plenteous: plentiful

		Verdant: (of countryside) green with grass or other rich vegetation; grassy, lush, rampant, thick; of the bright green color of lush grass

		Profuse: (especially of something offered or discharged) very plentiful (eg: profuse apologies); abundant, copious, unstinting, inordinate, effusive, fulsome, gushing; (in) (of a person) extravagant (eg: profuse in hospitality)

		Luxuriant: (of vegetation) rich and profuse in growth; lush, fecund, rampant, rank, verdant, thick; (of hair) thick and healthy

		Abound: exist in large numbers or amounts; proliferate, flourish, thrive, be thick on the ground

		Diaphanous: (especially of fabric) light, delicate, and translucent; filmy, gossamer, transpicuous, feathery, delicate, flimsy

		Transpicuous: transparent; easily understood, lucid

		Gossamer: a fine, filmy substance consisting of cobwebs spun by small spiders, seen especially in autumn; gauze; a light, thin, and insubstantial or delicate material or substance; diaphanous, frail, wispy, feathery, silky, sheer

		Gauze: a thin transparent fabric of silk, linen, or cotton; thin, loosely woven cloth used for dressings and swabs; a transparent haze or film; a very fine wire mesh

		Swathe: (n) a row or line of grass, corn, or other crop as it falls or lies when mown or reaped; a strip left clear by the passage of a mowing machine of scythe; a broad strip or rates of something; a piece or strip of material in which something is wrapped; (v) wrap in several layers of fabric; envelop, swaddle, cloak, shroud, drape, bedeck, enfold, wind, sheathe

		Swaddle: wrap (someone, especially a baby) in garments or cloth

		Bedeck: (with) decorate; adorn, ornament, beautify, enhance, furnish, grace, swathe, wreathe, festoon, array, bespangle, furbelow

		Grace: (n) smoothness and elegance of movement; courteous good will; decorum, breeding, couth, good manners, civility; an attractively polite manner of behaving; (in Christian belief) the free and unmerited favor of God, as manifested in the salvation of sinners and the bestowal of graces; a divinely go en talent or blessing; the condition or fact of being favored by someone (eg: fall from grace; commendation, preferment, esteem, regard, goodwill, indulgence, benefaction; a period officially allowed for payment of a sum due or for compliance with a law or condition; used as forms of description or address for a duke, duchess, or archbishop; (in Greek mythology) three beautiful goddesses (Aglaia, Thalia, Euphrosyne) believed to personify and bestow charm, grace, and beauty; (v) bring honor or credit to (someone or something) by one's attendance or participation; (of a person or thing) be an attractive presence in or on (eg: he graced the front page)

		Commend: praise formally or officially; extol, applaud, glorify, eulogize, laud, panegyrize, heap praise on, wax lyrical; present as suitable for approval or acceptance; recommend; make (something) acceptable or pleasing; entrust someone or something to; pass on someone's good wishes to

		Ruffle: (v) disorder or disarrange (someone's hair), typically by running one's hand through it; (of a bird) erect (it's feathers) in anger or display; disturb the smoothness or tranquility of; ripple, riffle, roughen; disconcert or upset the composure of (someone); ornament or gather into a frill; (n) an ornamental gathered or goffered frill or lace or other cloth on a garment, especially around the wrist or neck

		Ruche: a frill or pleat of fabric as decoration on a garment or soft furnishing

		Fallalery: tawdry finery

		Bespangle: cover or adorn with something that glitters or sparkles (eg: bejeweled and bespangled

		Spangle: (n) a small thin piece of glittering material, typically seen as one of many on clothing for decoration, a sequin; a spot of bright color or light; (v) cover with spangled or other small sparkling objects

		Sequin: a small shiny disc sewn on to clothing for decoration; a Venetian gold coin

		Furbelow: (n) a gathered strip or pleated border of a skirt or petticoat; showy ornaments or trimmings (eg: frills and furbelows) (v) adorn with trimmings

		Frill: a strip of gathered or pleated material seen on to a garment or larger piece of material as a decorative edging or ornamnet; ruffle, flounce, ruff, furbelow, jabot, peplum, flute, ruche; a thing resembling a drill in appearance or function (tiny frills of foam glistened white on the sea; a natural fringe of feathers or hair on a bird or other animal; an upward-curving bony plate extending behind the skill of many ceratopsian dinosaurs; an unnecessary extra feature or embellishment; gilding, ostentation, fuss, fallalery

		Pleat: (n) a double or multiple fold in garment or other item made of cloth, held by stitching the top or side; (v) fold into pleats

		Flounce: (v) go or move in an exaggeratedly impatient or angry manner; storm, strut; trimmed with a flounce or flounces; (n) an exaggerated action intended to express annoyance or impatience; a wide ornamental strip of material gathered and sewn to a skirt or dress; frill, ruffle, peplum, jabot, furbelow, ruche, fringe

		Jabot: an ornamental frill or ruffle on the front of a shirt or blouse, typically made of lace

		Peplum: a short gathered or pleated strip of fabric attached at the waist of a woman's jacket, dress, or blouse to create a hanging frill or flounce; (in Ancient Greece) a woman's loose outer tunic or shawl

		Ruche: a tight frill or pleat of fabric

		Tawdry: showy but cheap and of poor quality; gaudy, garish, vulgar, tasteless, paltry, meretricious, gimcrack, brummagem

		Meretricious: apparently attractive but having no real value; relating to or characteristic of a prostitute

		Garland: (n) a wreath of flowers and leaves, worn on the head or hung as a decoration; festoon, swag, lai, a prize or distinction; a literary anthology or miscellany; (v) decorate with a garland; festoon, wreathe, swathe, drape, adorn, bespangle, bedeck, bedizen, furbelow, caparison

		Festoon: (n) a chain or garland of flowers, leaves, or ribbons, hung in a curve as a decoration; a Eurasian butterfly or moth patterned with dark arcs on a lighter background; (v) adorn (a place) with chains, garlands, or other decorations

		Sheathe: put (a weapon such as a knife or sword) into a sheath; encase (something) in a close fitting or protective covering

		Drape: (v) arrange (cloth or clothing) loosely or casually on or round something; cover or wrap loosely with folds of cloth;  let (oneself or a part of one's body) rest somewhere in a casual or relaxed way; (of fabric) hang in loose, graceful folds; (n) long curyains( a cloth for covering parts of a patient's body other than that part on which a surgical operation is being performed; the way in which a garment or fabric hangs

		Wind: (v) (past: wound) cause (someone) to have difficulty breathing because of exertion or a blow to the stomach; gasping for breath, panting, huffing and puffing; make (a baby bring up wind after feeding by patting it's back; detect the presence of (a person or animal) by scent; sound (a bugle or call) by blowing; (different pronounciation) move in or take a twisting or spiral course; weave, meander, swerve, veer; pass (something) round a thing or person so as to encircle or enfold; wrap, furl, lace, entwine, wreathe; repeatedly twist or coil (a length of something) round itself or a core; coil, reel, roll; be twisted or coiled; wrap or surround (a core) with a coiled length of something; make (a clock of other device) operate by turning a key or handle; turn (a key or handle) repeatedly round and round; hoist or draw (something) with a windlass, winch, or similar device; (n) a twist or turn in a course; a sing turn made when winding

		Furl: roll or fold up (something) neatly and securely (eg: unfurl the sail)

		Thistledown: light fluffy down which is attached to thistle seeds, enabling them to be blown about in the wind

		Gauzy: resembling gauze; thin and translucent; sheer, see-through, delicate, gossamer, diaphanous, wispy, airy

		Bluff: (n,v) try to deceive someone as to one's abilities or intentions; masquerade, hoax, posture, dissemble, pretend, delude, deceive, mislead, hoodwink, dupe, beguile; (a) direct in speech or behavior but in a good natured way; frank, candid, blunt, forthright, genial, gruff, curt, abrupt; (of a cliff or a ship's bows) having a vertical or steep broad front; (n) a steep cliff, bank, or promontory; ridge, escarpment, precipice, eminence, overhang, rock face

		Escarpment: a long, steep slope, especially one at the edge of a plateau or separating areas of land at different heights

		Eminence: fame or acknowledged superiority within a particular sphere; an important or distinguished person; luminary, dignitary, bigwig; a piece of rising ground; a slight projection from the surface of the body

		Souse: (v) soak in or drench with liquid; (n) liquid used for pickling; a drunkard; a period of heavy drinking

		Brine: (n) water strongly imoregnated with salt; seawater; a solution of salt and water in which food is preserved; (v) soak or preserve in salty water

		Pickle: (n) a relish consisting of vegetables or fruit preserved in vinegar or brine; a pickled cucumber; liquid used to preserve food or other perishable items; used as an affectionate form of address to a mischievous child; (v) preserve food or other perishable items) in vinegar or brine; immerse (a metal object) in an acid or other chemical solution for cleaning

		Forecastle: (pronounced fowksul, abbreviated fo'c'sle) the forward part of a ship below the deck, traditionally used as the crew's living quarters; a raised deck at the bow of a ship

		Triturate: grind to a fine powder; chew or grind (food) thoroughly

		Paradigm: a typical example or pattern of something, a pattern or model; a world view underlying the theories and methodology of a particular scientific subject; a set of linguistic items that form mutually exclusive choices in particular syntactic roles

		Rind: (n) the tough outer skin of certain fruit, especially citrus fruit; skin, peel, zest, hull, pod, shell, husk, bark; the hard outer edge of cheese or bacon; the bark of a tree or plant; the skin or blubber of a whale (v) strip the bark from (a tree)

		Sheath: a cover for a blade; a protective covering around an electric cable; (sheath dress) a woman's close fitting dress; a condom

		Clutch: (v) grasp (something) tightly; grasp, clench, grip, claw at; (n) a tight grasp; a person's power or control, especially when regarded as inescapable

		Chary: (of) cautiously or suspiciously reluctant to do something; circumspect, wary, guarded, dubious, disinclined, iffy, apprehensive, uneasy

		Rutilant: glowing or glittering with red or golden light

		Proffer: (v) hold out or put forward (something) to someone for acceptance; tender, present, give, volunteer, propose, suggest; (n) an offer or proposal

		Fell: (v) cut down (a tree); hew, raze; knock down; topple, prostrate; (flat-fell) stitch down (the edge of a seam) to lie flat; (n) an amount of timber cut; a hill or stretch of high moorland; especially in northern England; (a) of terrible evil or ferocity; deadly

		Prostrate: (a) lying stretched out on the ground with one's face downwards; prone, procumbent, recumbent, sprawling; (with) completely overcome or helpless, especially with distress or exhaustion; growing along the ground; (v) throw oneself flat on the ground so as to be lying face downwards, especially in reverence or submission; reduce (someone) to extreme physical weakness; overwhelm, overpower, enfeeble, enervate, debilitate

		Prone: likely or liable to suffer from, do, or experience something unpleasant or regrettable; susceptible, disposed, apt to get; lying flat, especially face downwards; prostrate; denoting the position of the forearm with the palm of the hand facing downwards; with a downward slope or direction

		Suffuse: gradually spread through or over; permeate, bathe, pervade, wash, saturate, imbue, mantle, color

		Mantle: (n) a loose, sleeveless cloak or shawl; a covering of a specified sort (eg: a thick mantle of snow); canopy, pall, shroud, cloud, overlay; a bird's back, scapular, and wing coverts, esp. when of a specific color; an important role or resonsability that passes from a person to another; onus, burden; the region of the earth's interior between the crust and the core; (v) cloak or envelop; enshroud, swathe, envelop, disguise, cloud, overlay; (of the face) glow with a blush; (of a liquid) become covered with a head or froth; (of a bird of prey on the ground or on a perch) spread the wings and tail so as to cover captured prey

		Cud: partly digested food returned from the first stomach of ruminants to the mouth for further chewing

		Glade: an open space in a wood or forest (obsolete: a bright space between clouds; a gleam of light)

		Grovel: lie or crawl abjectly on the ground with one's face downwards (eg: grovel at one's feet); kneel, crawl, prostrate oneself; act obsequiously in order to obtain forgiveness or favor; fawn, kowtow, bow and scrape, abase unsealed, humble oneself

		Zest: (n) great enthusiasm and energy; zeal, gusto, fervor, ardor, verve, vigor, vitality, buoyancy, exuberance; a quality of excitement and piquancy; tang, spice, pungency; the outer colored part of the peel of citrus fruit, used as flavoring; (v) scrape off the peel of (a piece of citrus fruit) for use as flavoring

		Ardent: very enthusiastic or passionate; zealous, avid, fervid, eager, vehement, intense, fierce, foery, flaming, earnest; burning, glowing

		Ablaze: burning fiercely; alight, aflame, raging, flaming, blazing; (with) very brightly colored or lighted; (with) filled with anger or another strong emotion

		Gripe: (v,n) complain about something in a persistent, irritating way; affect with gastric or intestinal pain; grasp tightly, clutch; (v) secure (a boat) with gripes; (of a ship) turn to face the wind despite the efforts of the helmsman; (n) lashings securing a boat in its place in deck or in davits

		Smock: (n) a dress or top for a woman or girl, gathered at the chest and having a loosely fitting lower part; a loose overall worn to protect one's clothes; a smocked linen over garment worn by an agricultural worker; (v) decorate (a garment) with smocking

		Unceremonious: having or showing a lack of courtesy, rough and abrupt; summary, perfunctory, hurried, hasty, uncivil, discourteous, unmannerly; informal, relaxed, casual, loose

		Allure: (n) the quality of being powerfully and mysteriously attractive or fascinating; lure, pull, draw, appeal, glamour, enticement, temptation, bewitchment, enchantment, magnetism; (v) powerfully attract or charm; tempt, lure, entice, bewitch, beguile, captivate, enchant, tantalize, intrigue, fascinate

		Stow: pack or store (an object) carefully and neatly in a particular place; wedge, stash, bundle (shortening of bestow)

		Pelt: (v) hurl missiles repeatedly at; bombard, assail, batter, pepper, strafe, rake, enfilade, blitz, shower; hurl (something) at someone or something; (of rain, hail, or snow) fall quickly and very heavily; pour, teem, come down in stair rods; run somewhere very quickly; leap, race, dash, whizz, whoosh, buzz, zoom, stampede, career, bustle, hare, scurry, scud, scutter, scramble; (n) an act of hurling something at someone; the skin of an animal with the fur, wool, or hair still on it; hide, fleece, fell; the raw skin of a sheep or goat, stripped and ready for tanning; a person's hair

		Imprimatur: an official license used by the Roman Catholic Church to print an ecclesiastical or religious book; a person's authoritative approval

		Canny: having or showing shrewdness and good judgement, especially in money or business matters; astute, sharp, acute, penetrating, perceptive, perspicatious, clever, sensible, judicious, circumspect, prudent, cunning, wily, artful; pleasant, nice

		Leafy: having many leaves or much foliage; (of a plant) producing or grown for its broad bladed leaves; resembling a leaf or leaves

		Levy: (v,n) (on) impose (a tax, fee, or fine); mulct, exact, collect; impose a tax, fee, or fine on; (upon) seize (property) to satisfy legal judgement; enlist (someone) for military service; begin to wage (war); (n) a sum collected as a supplement to an existing subscription; a body of troops that have been enlisted

		Fervid: intensely enthusiastic or passionate, especially to an excessive degree; hot, burning, or glowing

		Eunuchoid: a sexually deficient individual, esp. one lacking in sexual differentiation and tending toward the intersexual state

		Equivoque: an expression capable of having more than one meaning; a pun; the fact of having more than one meaning; ambiguity (adj: equivocal)

		Aphorism: a pithy observation which contains a general truth; a concise statement of a scientific principle, typically by a classical author

		Felicitous: well chosen or suited for the circumstances; apt, fitting, pertinent, apropos, germane, suitable, apposite, congruous; pleasing and fortunate; advantageous, serendipitous, favorable, lucky, happy

		Bedizen: (with) dress up or decorate gaudily

		Caparison: (v,n) (of a horse) be decked out in rich decorative coverings

		Tang: (n) a strong taste, flavor, or smell; bite, edge, piquancy, spice, aroma, fragrance; a characteristic quality; the projection on the blade of a tool such as a knife, by which the blade is held firmly in the handle; a surgeonfish which occurs around reefs and rocky areas, where it browses on algae

		Davit: a small crane on board a ship, especially one of a pair for suspending or lowering a lifeboat

		Bewitch: cast a spell over (someone); entrance, enchant, hex, curse, tagati; enchant and delight (someone); enrapture, ravish, enthral, beguile, charm, spellbind, mesmerize, transfix

		Neurasthenic: an ill-defined medical condition characterized by lassitude, fatigue, headache, and irritability

		Fallow: (a) (of farmland) (to lie) ploughed and harrowed but left for a period without being sown in order to restore its fertility it to avoid surplus production; uncultivated, dormant, bare, virgin; (of a period of time) characterized by inaction; unproductive (eg: long fallow periods when nothing seems to happen); idle, time, barren, unfruitful; (of a sow) not pregnant; (n) a piece of fallow land; (v) leave (land) fallow for a period

		Blackguard: (n) a man who behaves in a dishonorable or contemptible way; (v) abuse or disparage (someone) scurrilously

		Scurrilous: making or spreading scandalous claims about someone with the intention of damaging their reputation; vituperative, derogatory, disparaging, pejorative, deprecatory, deflamatory, slanderous, libelous, opprobrious, vitriolic, venomous, contumelious; humorously insulting (ety: Latin 'scurra' meaning 'buffon')

		Grist: corn that is ground to make flour; malt crushed to make mash for brewing; useful material, especially to support an argument

		Coolie: (offensive) an unskilled native labourer in India, China, and some other Asian countries; a person from south or east Asia

		Retinue: a group of advisors, assistants, or others accompanying an important person; entourage, escort, court, cortège, suite

		Peddle: try to sell (something, especially small goods) by going from place to place; hawk, tout, push; sell (an illegal drug or stolen item); promote (an idea or view) persistently or widely

		Ingenuous: (of a person or action) innocent and unsuspecting; green, naive, untried, artless, candid, guileless

		Nip: (v) bite or pinch sharply; (of the cold or frost) damage or hurt; remove something by pinching or squeezing sharply; (n) a sharp bite of pinch; a feeling of biting cold

		Drafty: (Brit: draughty) (of an enclosed space) cold and uncomfortable because of currents of cool air; (of a door or window) ill-fitting and allowing in currents of cool air

		Bequest: a legacy; endowment, estate, heritage, bequeathal, bestowal, settlement, provision, devise; the action of bequeathing something

		Riotous: marked by or involving public disorder; characterized by wild and uncontrolled behavior; boisterous, uninhibited, uproarious, orgiastic, debauched, abandoned, rollicking depraved; having a vivid, varied appearance; hilariously funny

		Debauchery: excessive indulgence in sex, alcohol, or drugs; degeneracy, corruption, vice, turpitude, libertinism, indecency, iniquity, lechery, impropriety, lewdness, lecherousness, indulgence, lasciviousness, promiscuity,  decadence, salaciousness, profligacy, intemperance, hedonism, sybaritism, concupiscence, abandon, wantonness

		Orgy: a wild party characterized by excessive drinking and indiscriminate sexual activity; debauch, carouse, revel, bacchanal, saturnalia, Dionysiacs; an instance of excessive indulgence in a specified activity; secret rites used in the worship of bacchus, Dionysus, and other Greek and Roman deities, celebrated with dancing, drunkenness, and singing

		Saturnalia: the ancient Roman festival of Saturn in December, a period of general merrymaking and the predecessor of Christmas; an occasion of wild revelry or indulgence (eg: a saturnalia of shopping)

		Dionysiac: relating to the Greek god of the irrational and chaos, Dionysus, in dichotomous relation to the Apollonian; relating to the sensual, spontaneous, and emotional aspects of human nature

		Apollonian: relating to the Greek god of reason and the rational, Apollo (son of Zeus, brother of Dionysus); relating to the rational, ordered, and self-disciplined aspects of human nature

		Carouse: (n) a drunken revel; (v) to drink liquor freely or excessively; to take part in a carouse, engage in dissolute behavior

		Dissolute: (of a person or a way of live) overindulging in sensual pleasures; wanton, degenerate, unchaste, rakish, louche, licentious, lustful, libidinous, lecherous, promiscuous, intemperate

		Concupiscent: filled with sexual desire; lustful

		Turpitude: inherent baseness, (moral turpitude); a base act (ety: Latin 'turpis' meaning "vile" or "base")

		Base: (as 'a' only) without moral principles; ignoble; sordid, wicked, iniquitous, unscrupulous, squalid, unsavory, reprobate, ignominious, wretched, scandalous, infamous, abominable, tawdry, foul, vile, vulgar, despicable, unseemly; denoting or befitting a person of low social class; (of coins or other articles) not made of precious metal (eg: base currency)

		Befit: be appropriate for, suit; fitting, apt for, proper for, meet for

		Lecherous: having or showing excessive or offensive sexual desire; lubricious, prurient, carnal, lickerish, dissolute, wanton, lascivious, licentious, salacious, lewd

		Intemperance: lack of moderation, esp. habitual or excessive drinking of intoxicants

		Glisten: (v,n) (of something wet or greasy) shine with a sparkling light

		Crucible: a ceramic or metal container in which metals or other substances may be melted or subjected to very high temperatures; a situation of several trial, or in which different elements interact, leading to the creation of something new (melting pot)

		Conjuncture: (v,n) form an opinion or supposition about (something) on the basis of incomplete information; speculate, surmise, theorize, hopothesize, assume; (in textual criticism) propose (a reading) not present in the original source

		Sire: (n) the male parent of an animal, especially a stallion or bill kept for breeding; a respectful for of address for someone of high social status; (v) be the male parent of (an animal); (of a person) be the father of

		Annus mirabilis: a remarkable or auspicious year (ety: Latin for "wonderful year," originally used to refer to the year 1666, when the English defeated the Dutch fleet in the st James' day battle, and Isaac newton made major discoveries in calculus, motion, optics, and gravitation

		Amis horribilis: a year of disaster or misfortune

		Ply: (n) a thickness of layer of a folded or laminated material; a strand of yarn or rope; short for plywood; (v) work steadily with (a tool); handle, manipulate, operate, wield; work steadily at (one's business or trade); (of a vessel or vehicle) travel regularly over a route, typically for commercial purposes; regularly travel over (a route); (with) provide someone with (food and drink) in a continuous or insistent way; lavish, regale, heap; (with) direct (numerous questions) at someone

		Regale: entertain or amuse (someone) with talk; lavishly supply (someone) with food or drink

		Duress: (under) threats, violence, constraints, or other action used to coerce someone into doing something against their will or better judgement; forcible restraint or imprisonment

		Dialectical: relating to the logical discussion of ideas and opinions; concerned with or acting through opposing forces

		Dialectic: (n,a) the art of investigating or discussing the truth of opinions; enquiry into metaphysical contradictions and their solutions; the existence or action of opposing social forces, concepts, etc. (ety: Greek "dialektike" meaning "art of debate", itself from "dialegesthai" meaning "converse with")

		Panzer-: a German armored unit; used to describe enforcement of a particular ideology through violence or coersion (eg: panzercommunismus, panzercapitalism)

		Huddle: (v) (together) crowd together; nestle closely; (up) curl one's body into a small space; (brit) (on) heap together in a disorderly manner; (US) (with) have a private conversation; confer; (n) a close grouping of people or things; a number of people gathered together to speak about private or secret matters; confusion, bustle; a brief gathering of players during a game to receive instructions

		Nestle: to lie close and snug, like a bird in a nest

		Jangle: (v) make or cause to make a ringing metallic sound, typically a discordant one; chime, tintinnabulate; (with reference to a person's nerves) set or be set on edge; (n) a ringbing metallic sound

		Limp: walk with difficulty, typically because of a damaged or stiff leg or foot; hobble, stagger, falter, totter, dodder, stumble, shamble; (of a damaged ship, aircraft, of vehicle) proceed with difficulty

		Dipsomania: historical term describing a medical condition involving an uncontrollable craving for alcohol (ety: Greek "dipso" meaning thirst)

		Abnegation: (n,v) the action of renouncing or rejecting something; renunciation, eschewal, relinquishment, rejection; self denial; self-sacrifice, abstinence, asceticism, austerity, abstemiousness

		Abstemious: indulging only very moderately in something, especially food and drink; austere, spartan, abnegating, self-disciplined

		Spartan: showing or characterized by austerity or a lack of comfort or luxury; stern, arduous, stern, rigid, frugal, rigorous, abstemious, stringent

		Simper: (v,n) smile in an affectedly coquettish, coy, or ingratiating manner

		Turpentine: (n) a volatile pungent oil distilled from gum turpentine or pine wood, used in mixing paints and varnishes and in liniment; any of a number of trees which yield turpentine or a similar resin; (v) apply turpentine to

		Cad: (a: caddish) a man who behaves dishonorably, especially towards a woman

		Glaucous: of a dull greyish-green color; covered with a powdery bloom like that on grapes

		Commensurate: (with, nil) corresponding in size or degree, in proportion; commensurable, equivalent, proportional

		Esculent: (n, a) fit to be eaten; edible

		Bast: fibrous material from a plant, in particular the inner bark of a tree such as the lime, used as fiber in matting, cord, etc...

		Ambit: the scope, extents, or bounds of something (ety: Latin "ambire" meaning "go round")

		Exultant: triumphantly happy; jubilant, delighted, joyous, euphoric, ecstatic, rapturous, enraptured, in a frenzy of delight, delirious (with happiness), hysterical, swaggering, corybantic

		Semaphore: (n) a system of sending messages by holding the arms or two flags or poles in certain positions according to an alphabetic code; an apparatus for sending messages by semaphore, consisting of an upright with movable parts; a signal sent by semaphore; (v) send (a message) by semaphore or by signals resembling semaphore

		Garble: (v,n) reproduce (a message, sound, or transmission) in a confused and distorted way; muddle, jumble, confuse, blur, slur

		Mangle: (n) a machine for ironing sheets or other fabrics, using heated rollers; (v) press or squeeze with a mangle; destroy or severely damage by tearing or crushing; mutilate, main, lacerate, rend, butcher, maul; ruin or spoil (a text, piece of music, etc.); mar, mutilate, bungle

		Hoof: (n) the horny part of the foot of an ungukate animal, especially a horse; (v) (It) go on foot, dance; kick (a football) powerfully

		Roil: make (a liquid) turbid or muddy by disturbing the sediment; (of a liquid) move in turbulent, swirling manner; rile

		Jaded: bored or lacking enthusiasm, typically after having had too much of something; sated, satiated, cloyed, gorged, blunted, benumbed

		Inspissate: thicken or congeal

		Pythonesque: denoting or resembling the absurdist or surrealist humor or style of monthy python's flying circus (Brit tv show in early 70s)

		Fete: a celebration or festival; gala, jubilee, funfair, carnival, kermis

		Rack: a framework for holding or storing things; an instrument of torture consisting of a frame on which the victim was stretched by turning rollers to which the wrists and ankles were tied; a set of antlers; (v) cause extreme pain, anguish, or distress to; harrow, torment, torture, agonize, pierce, crucify, rend; torture (someone) on the rack; place in or on a rack; raise (rent) above a fair or normal amount; oppress (a tenant) by exacting excessive rent

		Drawbridge: a bridge, especially one over a castle's moat, which is hinged at one end so that it may be raised to prevent people crossing or to allow vessels to pass under it

		Plangent: (of a sound) loud and resonant, with a mournful tone; melancholy, plaintive (ety: Latin "plangere" meaning "to lament")

		Gangling: (a) (of a person) tall, thin, and awkward in movements or bearing; gaunt, lanky, rangy, wiry, spindly, scrawny, skeletal, gawky, ungainly (v) move ungracefully

		Filch: pilfer or steal (something, especially an item of small value) in a casual way

		Pilfer: steal (things of little value)

		Pelf: money, especialły when gained in a dishonest or dishonorable way

		Pennant: a tapering flag on a ship, especially one flown at the masthead of a vessel in commission; a long triangular or swallow-tailed flag, especially as the military ensign of lancer regiments

		Apotheosis: the highest point in the development of something; a culmination or climax; peak, pinnacle, zenith, apex, apogee; the elevation of someone to divine status (ety: Greek "apotheoun" meaning "make a God of")

		Pinnacle: an upright architectural member generally ending in a small spire and used especially in gothic construction to give weight especially to a buttress; a structure or formation suggesting a pinnacle; the highest point of development or achievement

		Mendacious: not telling the truth; lying, deceitful, insincere, disingenuous, Janus faced, duplicitous, fictitious; economical with the truth

		Edifice: a large, imposing building; a complex system of beliefs; erection, complex, construction, structure

		Ulterior: existing beyond what is obvious or admitted, intentionally hidden; underlying, covert, concealed, under wraps; beyond what is immediate or present (ety: Latin meaning further, more distant)

		Zugzwang: (n) in chess, a situation in which the obligation to make a move in one's turn is a serious, often decisive, disadvantage

		Snout: the projecting nose and mouth of an animal, esp. a mammal; a person's nose; the projecting front or end of something such as a pistol; a cigarette; a police informer

		Stout: (of a person) rather fat or of heavy build; plump, portly, fleshy, corpulent, boxom, ample, burly, meaty; (of an object) strong and thick; thick, robust, substantial, durable; having or showing courage and determination; gallant, fearless, intrepid, mettlesome, lionhearted, heroic, doughty, unflinching, unyielding, unfaltering, unbending, stalwart, steadfast, staunch, dauntless

		Rotund: rounded; marked by fullness of sound or cadence; plump, chubby

		Buxom: (of a woman) full-bosomed; (of a woman) healthy, plump, cheerful, and lively

		Abdominous: having a large belly, potbellied

		Flinch: (v,n) make a quick nervous movement of the face of body as an instinctive reaction to fear or pain; wince, shrink, shy away, squirm, quiver, shudder, quail, cower, waver, falter, blanch; avoid doing or becoming involved in (something) through fear or anxiety; demure, recoil, shy away, baulk at, jib at, quail at

		Doughty: marked by fearless resolution, intrepid

		Stave: (n) a vertical wooden post or plank in a building or other structure; any of the lengths of wood fixed side by side to make a barrel, bucket, or other container; a strong wooden stick or iron pole used as a weapon; a verse or stanza of a poem; (v) (in, through) break something by forcing it inwards or piercing it roughly; (off) avert or delay something bad or dangerous; forestall, preclude, ward off

		Numinous: having a strong religious or spiritual quality; indicating or suggesting the presence of a divinity (ety: Latin "numin" meaning diving will

		Commiserate: (with) express or feel sympathy or pity; sympathize

		Arabesque: a ballet posture in which one leg is extended backwards at right angles, the torso bent forward, the arms outstretched, one forward and one backward; an ornamental design consisting of intertwined flowing lines, originally found in ancient Islamic art; a passage of music or composition with fanciful ornamention of the melody

		Pastiche: (n) an artistic work in a style that imitates that of another work, artist, or period; an artistic work consisting of a medley of pieces imitating various sources; blend, medley, mélange, patchwork; (v) imitate the style of (an arist or work)

		Queasy: nauseous, feeling sick; bilious, ill, dizzy, liverish, green about the gills, out of sorts; inducing a feeling of nausea; slightly nervous or worried about something

		Muffler: a wrap or scarf work around the neck and face for warmth; a device used to deaden the sound of a drum, bell, piano, or other instrument; a silencer for a motor vehicle exhaust

		Gelid: icy, extremely cold; glacial, polar, wintry, Siberian, hyperborean; hyperboreal

		Hyperborean: (n) an inhabitant of the extreme north; in Greek mythology, a member of a people worshipping apollo and living in a land of sunshine and plenty beyond the north wind; (a) relating to the extreme north (ety: Greek "huperboreos" meaning "beyond + north wind")

		Seraphic: characteristic of or resembling a seraph or seraphim, angelic; beatific, sublime, rapturous, serene, ethereal, cherubic, celestial

		Ethereal: (something or someone) being light, airy, or heavenly

		Trill: (n) a quavering or vibratory sound, especially a rapid alternation of sung or played notes; (n,v) the pronunciation of a consonant, esp. r, with rapid vibration of the tonight against the palate or the uvula; (v) produce a quavering of warbling sound; warble, chirrup,chirp, tweet, twitter

		Warble: (n) a melodious succession of low pleasing sounds; a trill; the act of warbling (v) to sing or whistle (something, or nil) with trills, quavers, or melodic embellishments; to express or celebrate in or as if in song

		Quaver: (v,n) (of a person's voice) shake or tremble in speaking, typically through nervousness or emotion; flutter, fluctuate, waver, ripple, trill, warble

		Heliotrope: a plant of the borage family, cultivated for its fragrant purple, which are used in perfume; a light purple color, similar to that of heliotrope flowers; a plant of which the orientation turns to of from the sun

		Fuss: (n) a display of unnecessary or excessive excitement, activity, or interest; ado, uproar, commotion, rigmarole, brouhaha, furore, pantomime; a protest or disputed or a specified degree or kind (eg: too much of a fuss); elaborate or complex procedures, trouble or difficult; inconvenience, hassle; (v) show excessive or unnecessary concern about something; worry, fret, make a mountain out of a molehill; busy oneself restlessly; bustle, scurry, tear around; treat (someone) with excessive attention or affection

		Palsy: (n) paralysis, esp. that which is accompanied by involuntary tremors; (v) affect with paralysis and involuntary tremors

		Incurvation: inward curvature

		Swell: (v) (esp. of a part of the body) become larger or rounder in size; become of make greater in intensity, number, amount, or volume; be intensely affected or filled with a particular emotion; brim, overflow, be overcome; (n) a full or gently rounded shape or form (eg: the soft swell of her breast); a gradual increase in amount, intensity, or volume; a welling up of a feeling; a slow regular movement of the sea in rolling waves that do not break; billow, roll, undulation; a mechanism for producing a crescendo or diminuendo in an organ or harmonium; a fashionable or stylish person of wealth or social position

		Well: (2nd def.) (n) a shaft sunk into the ground to obtain water, oil, or gas; a place where there are mineral springs; a depression made to hold liquid; a plentiful source or supply; fountainhead, mine; an enclosed space in the middle of a building, giving room for stairs or a life, or to allow light or ventilation; a shelf beneath the counter of a bar on which bottles of alcohol are stored within easy reach of the person serving; (v) (up) (of a liquid) rise up to the surface and spill or be about to spill; flow, stream, gush, cascade, spurt, surge, ooze, trickle, disembogue; (up) (of an emotion) develop and become more intense

		Nates: the buttocks

		Stipple: (v) (in drawing, painting, and engraving) mark (a surface) with numerous dots or specks; produce a decorative effect on (paint or other material by roughening it's surface when it is wet; (n) the process or technique of stippling a surface; or the effect do created

		Dapple: (v) mark with spots or rounded patches; stipple, fleck, dot, mottle, bespeckle, speckle, streak; (n) a patch or spot of color or light; an animal with a dappled coat

		Nacre: mother-of-pearl

		Poplar: a tall, fast growing tree of north temperate regions, widely grown in shelter belts and for timber and pulp; North American term for tulip tree

		Tulip tree: a deciduous North American tree which has large distinctively lobed leaves and insignificant tulip-like flowers; informal term for magnolia (in the plant sense)

		Magnolia: a tree or shrub with large, typically creamy-pink or -white, waxy flowers; a pale creamy-white color like that of magnolia blossom

		Deciduous: (of a tree or shrub) shedding its leaves annually; (of a tree of shrub) broadleaved; denoting the milk teeth of a mammal, which are shed after a time (ety: Latin "decidere" meaning "fall down or off")

		Cesspool: an underground container for the temporary storage of liquid waste and sewage; a disgusting or corrupt place

		Febrile: having or showing the symptoms of a fever; ferverish, fevered, fiery, in a cold sweat, delirious, pyretic; characterized by a great deal of nervous excitement or energy (ety: Latin "febris"meaning "fever")

		Dejected: sad and depressed; dispirited, downcast, downhearted, despondent, disconsolate, crestfallen, disheartened, demoralized, desolate, doleful, melancholy, miserable, woebegone, forlorn, wretched, gloomy, glum, dismal, dolorous

		Glum: looking or feeling dejected; morose, lugubrious, mirthless,dour, saturnine, sepulchral

		Sepulchral: relating to a tomb or interment; gloomy, dismal

		Dolorous: causing, marked by, or expressing misery or grief

		Crestfallen: having a drooping crest or hanging head; felling shame or humiliation, dejected

		Woebegone: strongly affected with woe; exhibiting great woe, sorrow, or misery; being in a sorry state; forlorn

		Forlorn: bereft, forsaken; sad or lonely because of isolation or desertion; being in poor condition; nearly hopeless

		Wretched: deeply afflicted, dejected, or distressed in body or mind; extremely or deplorably bad or distressing; being or appearing mean, miserable, or contemptible; very poor in quality or ability

		Wretch: an unfortunate or unhappy person; (informal) a despicable or contemptible person; rogue, cad, reprobate, delinquent, rascal, ruffian, rapscallion, miscreant, dastard, varlet, knave, blackguard, whoreson, wastrel

		Whoreson: (n) a bastard; wretch, scoundrel; (a) wretched, scurvy

		Scurvy: (n) a disease caused by a deficiency of vitamin C, characterized by swollen bleeding gums and the opening of previously healed wounds, which particularly affected poorly nourished sailors until the end of the 18th century; (a) worthless of contemptible

		Wastrel: a wasteful person, spendthrift, prodigal; an idler or vagabond

		Prodigal: (a) spending money or using resources freely and recklessly; wastefulky extravagant; having or giving something of a lavish scale; (n) a person who spends money on a recklessly extravagant way; ("daughter" or "son") à person who leaves home to lead a prodigal life but later makes a repentant return (ety: Latin "prodigus" meaning "lavish")

		Ague: malaria or another illness involving fever or shivering; a fever or shivering fit

		Amidships: in the middle of a ship

		Astern: behind or towards the rear of a ship or aircraft

		Yank: (v, n) pull with a jerk; tug, wrench, heave, haul, tear, snatch, whisk, jolt

		Whisk: (v) take or move (someone or something) somewhere suddenly and quickly; beat or stir (a substance, especially cream or eggs) with a light, rapid movement; (n) a utensil for whipping eggs or cream; a bunch of grass, twigs, or bristles, for removing dust or flies; a brief, rapid action or movement, a flick

		Levee: an embankment built to prevent the overflow of a river; a ridge of sediment deposited naturally alongside a river by overflowing water; a landing place, a quay; a formal reception of visitors or guests; an afternoon assembly for men held by the British monarch or their representative; a reception of visitors just after rising from bed

		Dirndl: a full, wide skirt with a tight waist and; a woman's dress in the style of alpine peasant costume, with a birndl skirt and a close fitting bodice

		Bunting: an old world seed eating songbird related to the finches, typically having brown streaked plumage and a boldly marked head; a small new world songbird of the cardinal subfamily, the male of which is mainly or partly bright in color; flags and other colourful festive decorations; a loosely woven fabric used to make bunting; a hooded sleeping bag for babies

		Brill: a European flatfish resembling a turbot

		Rove: (v) travel constantly without a fixed destination, wander; roam, ramble, meander, drift, go hither and thither, peregrinate, circumambulate, vagabond; wander over or through (a place); travel for one's work having no fixed base; (of a person's eyes) look in changing directions in order to see something thoroughly; form (slivers of wool, cotton, or other fiber) into roves; (n) a journey, especially one with no specific destination; an act of wandering; a sliver of cotton, wool, or other fiber, drawn out and slightly twisted, especially preparatory to spinning

		Reeve (rove, rove): thread (a rope or rod) through a ring or other aperture

		Sliver: (n) a small, thin, narrow piece of something cut or split off a larger piece; a strip of loose untwisted textile fibers produced by carding; (v) cut or break (something) into small, thin, narrow pieces; convert (textile fibers) into slivers

		Peregrine: (n) a powerful falcon found on most continents, breeding chiefly on mountains and costal cliffs and much used for falconry; (a) coming from another country; foreign or outlandish

		Cant: (n) hypothetical and sanctimonious talk, typically of a moral, religious, or political nature; pietism, affected piety, hypocrisy, pretense, pharisaism, tartufferie; language specific to a particular group or profession and regarded with disparagement; idiom, argot, patois, vernacular; (as "cant phrase") denoting a phrase or catchword temporarily current or in fashion; a slope or tilt; a wedge-shaped block of wood, esp. one remaining after the better-quality pieces have been cut off; (v) talk hypocritically and sanctimoniously about something; have or cause to have a slanting or oblique position; tilt, lean, slant, angle, incline, tip, list, bank; (of a ship) swing round

		Tip: (over) overturn or upset (something); to raise and tilt (a hat) in salute; to become tipped; (the scales) to register weight or to shift the balance of power or influence

		Liebestod: title of the final, dramatic music from the 1859 opera Tristan and Isolde by Richard Wagner; refers to the theme of erotic death of "love death" meaning the two lovers' consummation in their love in death or after death (ety: German meaning "love death"

		Wintry: characteristic of winter, especially in feeling or looking very cold and bleak

		Entablature: the upper part of a classical building (below the pediment) supported by columns of a colonnade, comprising the architrave, frieze, and cornice

		Architrave: (in classical architecture) a main beam resting across the tops of columns; the moulded frame around a doorway or window; a moulding round the exterior of an arch

		Frieze: a broad horizontal band of sculpted or painted decoration, esp. on a wall near the ceiling; a horizontal paper strip mounted on a wall to give an effect similar to that of a sculpted or painted frieze; the part of an entablature between the architrave and the cornice; heavy, coarse woolen cloth with a nap, usually on one side only

		Fellah: (plural fellahin) an Egyptian peasant

		Inlay: (v) ornament (an object) by embedding pieces of a different material in it, flush with its surface; embed (material or a design) flush with the surface of an object; (n) a design, pattern, or piece of material inlaid in something; a material or substance that is used as an inlay; inlaid work; the technique of inflating material; a filling shaped to fit a tooth cavity

		Flush: (v) (of a person's skin, face, etc.) become red and hot, typically as the result of illness or strong emotion; blush, redden, tint, crimson, mantle; make red and hot; glow or cause to glow with warm color or light; cleanse (something, esp. a toilet) by causing large cantities of water to pass through it; cause (a liquid) to flow through something; drive (a bird, esp. a game bird, or an animal) from its cover; (out) cause to be revealed, force into the open; (of a plant) send out fresh shoots; (n) a reddening of the face, skin, etc; an area of warm color or light; a sudden rush of intense emotion; (as "first flush") a period when something is new or particularly fresh and vigorous; a sudden abundance or spate of something; an act of flushing, especially a toilet; a sudden flow; the action of driving an animal or game bird from its cover

		Spate: a large number of similar things coming in quick succession; flurry, series, cluster, outbreak, epidemic, wave, plague, flood, deluge, torrent, outpouring; a sudden flood in a river

		Hinge: (n,v) attach or join with or as if with a hinge; (of part of a structure) handg and turn on a hinge; depend entirely on; be contingent, revolve around, pivot, hang, rest, be subject to, be conditional, be dependent

		Haze: (n) a slight obscuration of the lower atmospher, typically cause by fine suspended particles; mist, fog, cloud, smog; a very fine cloud ofnsomething such as vapor or smoke in the air; a state of mental confusion; blur, daze, muddle, befuddlement, obscurity, dimness, indistinctness, vagueness; (v) obscure with a haze; force (a new potential recruit to the military or military fraternity) to perform strenuous, humiliating, and dangerous tasks; drive (cattle) while on horseback

		Suborn: bribe or otherwise induce (someone) to commit an unlawful act such as perjury

		Mongrel: a dog of no definable type or breed; any animal resulting from te crossing of different breeds or types; (offensive) a person of mixed descent

		Debar: exclude or prohibit (someone) officially from doing something; bar, disqualify, disentitle, preclude, blackball, ban

		Such as: for example; of a kind that, like; those who (eg: (from Lolita) ... the fey grace, the elusive, shifty, soul-shattering, elusive charm that separates the nymphet from such coevals of hers as are incomparably more dependent on the special world of synchronous phenomena than on that intangible island of entranced time where Lolita plays with her likes)

		Tabulate: arrange (data) in tabular form

		Loin: the part of the body on both sides of the spine between the lowest (false) ribs and the hip bone; the region of the sexual organs regarded as the source of erotic or procreative power; a joint of meat that includes the vertebrae of the loins

		Comely: (humorous) (typically of a woman) pleasant to look at; attractive, lovely, stunning, arresting, gorgeous, prepossessing, fetching, captivating, beguiling, charming, enchanting, alluring, tantalizing, ravishing, luscious, nubile, lush, luscious, sightly; agreeable or suitable

		Prepossessing: tending to create a favorable impression, attractive; (archaic) creating prejudice

		Nubile: of marriageable condition or age; sexually attractive

		Conjunction: a word used to connect clauses or sentences or to coordinate words in the same clause (eg: but, if, lest); the action or an instance of two or more events or things occurring at the same point in time or space; concomitance, synchrony, synchronicity, concurrence; an alignment of two planets or other celestial objects so that they appear in the same, or nearly the same, place in the sky

		Voluble: (of a person) talking fluently, readily, or incessantly; loquacious, long-winded, effusive, expansive, articulate, eloquent, glib; (of speech) characterized by fluency and readiness of utterance

		Glib: (of words or a speaker) fluent but insincere and shallow

		Preen: (of a bird) tidy and clean its feathers with its beak; groom, plume; (of a person) devote effort to making oneself look attractive and then admire one's appearance; (oneself) congratulate or pride oneself

		Quiver: (v ) tremble or shake with a slight rapid motion; shiver, quaver, shudder, convulse, flutter, flap, vibrate; cause (something) to make a slight motion (eg: the bird quivered its wings); a slight, trembling movement or sound, especially one caused by a sudden strong emotion

		Indigent: (a,n) poor, needy; impecunious, destitute, pauperized, insolvent, distressed, beggardly, penurious

		Coruscate: (of light) flash or sparkle

		Plush: (n) a rich fabric of silk, cotton, wool, or a combination of these, with a long, soft nap; (a) richly luxurious and expensive

		Waddle: (v,n) walk with short steps and a clumsy swaying motion; toddle, dodder, wobble, totter, shamble, stagger, reel

		Darn: (v) mend (a hole in knitted material) by interweaving yarn with a needle; embroider (material) with a large running stitch; (n) a place in a garment that has been darned

		Contra mundum:  against the world

		Delirious: in an acutely disturbed state of mind characterized by restlessness, illusions, and incoherence, affected by delirium; deranged, frenzied, unhinged, demented, hysterical; in a state of wild excitement or ecstasy; euphoric, rapt, rapturous, jubilant, exultant

		Doggerel: (as "doggerel verses") comic verse composed in irregular meter; verse or words that are badly written or expressed

		Antediluvian: of or belonging to the time before the biblical flood; (humorous) ridiculously old-fashion; superannuated, outdated, anachronistic, antiquated, archaic, obsolete, passé, prehistoric

		Yawp: (n) a harsh or hoarse cry or yelp; foolish or noisy talk; (v) shout or exclaim hoarsely; talk foolishly or noisily

		Inviolate: free or safe from injury or violation; unprofaned, pristine, undefiled, unsullied, unmarred, unscathed

		Pinchbeck: (n) an allot of copper and zinc resembling gold, used in watchmaking and cheap jewelry; (a) appearing valuable, but actually cheap or tawdry

		Comprehend: grasp mentally, understand; fathom, perceive, discern, divine, unravel, decipher, puzzle out; include, comprise, or encompass

		Insufferable: too extreme to bear; intolerable, more than flesh and blood can stand, unspeakable, excruciating, grim, overwhelming, too much to bear; having or showing unbearable arrogance or conceit; boastful, immodest, vain, vainglorious

		Litany: a series of petitions for use in church services or processions, usually recited by the clergy and responded to in a recurring formula by the people; a litany contained in the book of common prayers; a tedious recital or repetitive series; enumeration, listing, catalogue

		Arable: (a) (of land) suitable or used for growing crops; (of crops) able to be grown on arable land; concerned with growing arable crops; (n) arable land or crops

		Thrum: (v) make a continuous rhythmic humming sound; strum (the strings of a musical instrument) in a rhythmic way; cover or adorn (cloth or clothing) with ends of thread; (n) a continuous rhythmic humming sound; (in weaving) an unwoveb end of a warp thread, or a fringe of such ends, left in the loom when the finished cloth is cut away; any short loose thread

		Loom: (n) an apparatus for making fabric by weaving yarn or thread; a vague and often exaggerated first appearance of an object seen in darkness or fog, especially at sea; the dim reflection by cloud or haze of a light which is not directly visible, eg: from a lighthouse over the horizon; (v) appear as a vague form, especially one that is large or threatening; (of an event regarded as threatening) seem about to happen; brew, menace, impend, be imminent, be on the horizon, be ominously close

		Warp: make or become bent or twisted out of shape, typically as a result of the effects of heat or damp; make abnormal or strange, distort; (with reference to a ship) move or be moved along by hauling on a rope attached to a stationary object ashore; (in weaving) arrange (yarn) so as to form the warp of a piece of cloth; cover (land) with a deposit of alluvial soil by natural or artificial flooding; (n) a twist or distortion in the shape of something; an abnormality or perversion in a person's character; (in weaving) the threads on a loom over and under which other threads (the weft) are passed to make cloth; a rope attached at one end to a fixed point and used for moving or mooring a ship

		Weft: (in weaving) the crossword threats on a loom that are passed over and under the warp threads to make cloth

		Alluvium: a deposit of clay, silt, and sand left by flowing floodwaters in a river valley or delta, typically producing fertile soil

		Silt: (n) fine sand, clay, or other material carried by running water and deposited as a sediment, esp. in a channel or harbor; a bed or layer of silt; (v) fill or become filled or blocked with silt

		Delta: a triangular tract of sediment deposited at the mouth of a river, typically where it diverges into several outlets

		Forgather: assemble of gather together

		Spectral: of or like a ghost; ghostly, wraithlike, incorporeal, disembodied, ghastly, phantasmic

		Imprecation: a spoken curse; anathema, hex, malison, sacrilege, blasphemy, foul language, execration, cuss word

		Foreshorten: portray or show (an object or view) as closer than it really is or as having less depth and distance, as an effect of perspective or the angle of vision; prematurely or dramatically shorten or reduce (something) in time or scale

		Ape: a large primate that lacks a tail, including the gorilla, chimpanzees, orangutan, and gibbons; (in general use) any monkey; an unintelligent or clumsy person; an inferior imitator or mimic (eg: cunning is but the ape of wisdom); (v) imitate (someone or something) especially in an absurd or unthinking way; echo, caricature, mimic

		Throe: intense of violent pain and struggle, especially accompanying birth, death, or great change; agony, paroxysm, excruciation, distress, hardship

		Dhow: a lateen-rigged ship with one or two masts, used chiefly in the Arabian region

		Lateen: (n) a triangular sail on a long yard at an angle of 45 degrees to the mast

		Dell: a small valley, usually among trees

		Yore: of long ago or former times (used in nostalgic or mock-nostalgic recollection

		Gooseberry: a round edible yellowish-green or reddish berry with a thin translucent hairy skin; the thorny European shrub which bears gooseberries; (informal) a third person in the company of two people, especially lovers, who prefer to be alone. A third wheel

		Ballerina: a female ballet dancer; a ballet shoe

		Thatch: (n) a roof covering of straw, reeds, palm leaves, or a similar material; straw or a similar material used for covering a roof; (informal) (as "a thatch of") a person's hair, especially when thick or unruly; a matted layer of dead stalks, moss, and other material in a lawn; (v) cover (a roof or a building) with a straw or a similar material

		Scrounge: (v,n) seek to obtain (something, typically food or money) at the expense or through the generosity of  others or by stealth; search for or obtain by searching

		Snivel: (v,n) cry and sniffle; complain in a whining or fearful way; bleat, carp

		Bleat: (v,n) (of a sheep, goat, or calf) make a characteristic weak, wavering cry; speak or complain in a. Weak, querulous, or foolish way

		Carp: (n) a deep bodied freshwater fish, typically with barbels around the mouth; (v) complain or find fault continually about trivial matters; cavil, bleat, disparage

		Cavil: (v,n) make petty or unnecessary objections

		Ladle: (n) a large long-handled spoon with a cup shaped bowl; a container for transporting molten metal in a foundry; (v) serve (soup, stew, or sauce) with a ladle; (out) provide (information, advice, etc.) lavishly or overgenrously

		Demur: (v) raise objections or show reluctance; (n) the action of objecting to ornhesotating over something

		Pathos: a quality that evokes pity or sadness

		Ethos: the characteristic spirit of a culture, era, or community as manifested in its attitudes and aspirations; atmosphere, climate, flavor, essence, quintessence, zeitgeist

		Persiflage: light and slightly contemptuous mockery or banter

		Firmament: the heavens or sky; the wide blue yonder, the azure, the celestial sphere, the empyrean, the welkin, he vault of heaven

		Empyrean: (a) relating to heaven;  (n) the highest part of heaven, thought by the ancients to be the realm of pure fire; he visible heavens; the sky

		Welkin: the sky or heaven

		Tarpaulin: heavy duty waterproof cloth, originally of tarred canvas; a sheet of covering of tarpaulin; a sailor's tarred or oilskin hat; a sailor

		Slaphappy: cheerfully casual in a careless or irresponsible way; devil-may-care, blithe, nonchalant, insouciant;  (of an action or operation) unkethodicsl. Poorly thought out; dazed or stupefied by or as if by a series of blows to the head. Punch-drunk

		Cinder: a small piece of partly burnt coal or wood that has stopped giving off flames but still has combustible matter in it; ashes; waste matter produced by smelting or refining ore. Slag

		Caryatid: a stone carving of a draped female figure, used as a pillar to support the entablature of a Greek or Greek-style building

		Jackknife: (n) a large knife with a folding blade; a dive in which the body is first bent and the waist and then straightened; (v) move one's body into a bent or doubled-up position; (of an articulated vehicle) bend into a v shape in an uncontrolled skidding movement; (of a diver) perform a jackknife

		Aswirl: covered or surrounded with something swirling; swirling

		Awning: a sheet of canvas or other material stretched on a frame and used to keep the sun or rain off a shop window, doorway, or ship's deck; canopy, tarpaulin, velarium

		Argosy: a large merchant shop, originally one from Ragusa (now Dubrovnik) or Venice

		Jab: (v) poke roughly or quickly, especially with something sharp or pointed; jolt, prod, dig, lunge, stab, thrust; roughly or quickly thrust (a sharp or pointed object) at someone or something; (n) a quick, sharp blow, especially with the fist; a sharp, painful sensation or emotion

		Simian: (n,a) resembling, relating to, or affecting apes or monkeys (ety: Greek "simos" meaning "flat-nosed")

		Russet: (a) reddish brown in color; rustic, homely; (n) a reddish-brown color; a dessert apple of a variety with a slightly rough brownish skin; a coarse homespun reddish-brown or grey cloth used for simple clothing

		Pat: (v) touch quickly and gently with the flat or the hand; pet, fondle, stroke, caress, rub; draw attention to (something) by tapping it gently; (down) mould into shape or put in position with gentle taps; (n) a quick, light touch with the hand; a compact mass of soft material; lump, dab, cake, chunk, hunk, wedge, ball, curl; (a) simple and somewhat glib or unconvincing; perfunctory, facile, simplistic; (adv) at exactly the right moment or in te right way; very conveniently or opportunely

		Opportune: (of a time) especially convenient or appropriate for a particular action or event; auspicious, propitious, favorable, heaven-sent, golden, providential, felicitous, timely, ripe, expedient, apt, pertinent; done or occurring at a favorable time

		Fondle: stroke or caress lovingly or erotically; massage, knead, twiddle, tickle

		Twiddle: (v) twist, move, or fiddle with (something) , typically in a purposeless or nervous way; turn or move in a twirling way; (n) an act of twisting or fiddling with something; a twisted or curled mark or design; a rapid or intricate series of musical notes

		Twirl: (v) spin quickly and lightly round, especially repeatedly; pirouette, whirl, gyrate, swivel, rotate; cause to rotate; coil, curl, wind, twist; (n) an act of spinning; a spiraling or swirling shape, especially a flourish made with a pen (eg: twiddles and twirls)

		Knead: work (moistened flour or clay) into dough or paste with the hands; make (bread or pottery) by kneading flour or clay; massage or squeeze with the hands

		Providence: the protective care of god or of nature as a spiritual power; timely preparation for future eventualities; foresight, prudence, forethought, judgement, precaution, shrewdness, circumspection

		Cockle: (n) an edible burrowing bivalve mollusk with a sting robbed shell; a small, shallow boat; (v) (of paper) for wrinkles or puckers

		Pucker: (v) (up) (esp. with reference to a person's face) tightly gather or contract into wrinkles or small folds (eg: the child's face puckered, ready to cry); wrinkle, crinkle, cockle, crumple, rumple, corrugated, scrunch up, ruffle, crease, shrivel, furrow, crimp, pleat; (n) a tightly gathered wrinkle or small fold

		Tremulous: shaking of quivering slightly; timid, nervous; timorous, diffident, anxious, apprehensive

		Ecru: the light fawn color of unbleachedlinen

		Chiaroscuro: the treatment of light and shade in drawing and painting; an effect of contrasted light and shadow

		Harlequin: (n) a mute character in traditional pantomime, typically masked and dressed in a diamond patterned costume; jester, joker, Merry Andrew, droll, zany; a stock comic character in Italian commedia dell'arte; a small duck of fast-flowing streams around te arctic and North Pacific, the male having mainly grey-blue plumage with bold white markings; (a) in varied colors; variegated, particopored, many-hued, jazzy, kaleidoscopic

		Jazzy: of, resembling, or in the style of jazz; bright, colorful, and showy; lurid, garish, flamboyant, vibrant, vivid

		Merry Andrew: a person who entertains others by means of comic antics. A clown

		Droll: (a) curious or unusual in a way that provokes dry amusement; quaint, queer, odd, eccentric, outlandish, bizarre, whimsical, peculiar, idiosyncratic

		Whimsical: playfully quaint or fanciful, esp. in an appealing and amusing way; acting or behaving in a capricious manner; wayward, vacillating, protean, quicksilver, inconsistant, erratic, capricious, unpredictable, volatile, impulsive, excitable, fickle

		Wayward: difficult to control or predict because of willful or perverse behavior; whimsical, contumacious

		Willful: (of a bad or harmful act) intentional and deliberate; having or showing a stubborn and determined intention to do as one wants, regardless of the consequences; mulish, pig-headed, obstinate, obstreperous, wayward, mutinous

		Mulish: resembling or likened to a mule in being stubborn

		Obstreperous: noisy and difficult to control (ety: Latin "strepere" meaning "make a noise" + "ob" meaning "against")

		Fickle: changing frequently, esp. as regards one's loyalties or affections

		Contumacious: (especially of a defendant's behavior) stubbornly or willfully disobedient to authority

		Zany: (a) amusingly unconventional and idiosyncratic; bizarre, quirky, ludicrous, outlandish, peculiar, mad, absurd, comical, farcical; (n) a zany person; a comic performer partnering a clown, whom he imitated in an amusing way

		Grubby: covered with dirt; grimy, sooty, squalid, slatternly, slovenly, shabby, unkempt; involving sihonest or disreputable activity. Sordid

		Grub: (v only) dog or pole about in soil; (up) remove something the earth by digging it up; unearth, disinter, uproot, deracinate; search in a clumsy and unmethodical manner; work hard, esp. at a dull or demeaning task; achieve or acquire (something) by doing demeaning work

		Condescend: show that one feels superior. Be patronizing; look down one's nose at, put down, speak haughtily to; do something in such a way as to emphasize that one clearly regards it as below one's dignity or level of importance; deign, stoop, see fit, vouchsafe

		Stoop: (v) bend one's head or body forwards and downwards; have the head and shoulders habitually bent forward; (to) lower one's moral standards so far as to do something reprehensible; sink, resort; (of a bird of prey) swoop down on a quarry; (n) a stooping posture; the downward swoop of a bird of prey

		Swoop: (especially of a bird) move rapidly downward through the air; zoom, plummet, dive, pounce, nosedive, plunge; (on) carry out a sudden attack, esp. in order to make a capture or arrest; (n) a swooping of snatching movement or action

		Vouchsafe: give or grant (something) to (someone) in a gracious or condescending manner; reveal or disclose (information)

		Deign: do something that one considered to be beneath one's dignity; condescend to give (something)

		Garrulous: excessively talkative, esp. on trivial matters

		Flute: (n) vertical or transverse flute; an ornamental vertical groove in a column; a trumpet shaped grill on a dress or other garment; a tall, narrow wine glass; (v) play a flute or pipe; speak in a melodious way; make flutes or grooves in

		Stilt: either of a pair of upright poles with support for the feet enabling the used to walk at a distance above the ground; each of a set of posts or piles supporting a building; a long-billed wading bird with predominantly black and white plumage and very long slender reddish legs

		Barge: (n) a long flat-bottomed boat for carrying freight on canals and rivers, either under its own power or towed by another; (v) (into) move forcefully or roughly; (in on) intrude or interrup rudely or awkwardly; (chiefly in a sporting context) run into and collide with (someone) typically intentionally; convey (freight) by barge

		Coo: (v) (of a pigeon or dove) make a soft murmuring sound; (of a person) speak in a soft gentle voice; (n) a soft murmuring sound made by a dove or pigeon

		Facsimile: (n,v) make an exact copy, esp. of written or printed material

		Rive (rived, riven): split or tear apart violently; cleave, rent; split or crack (wood or stone); (of wood or stone) split or crack

		Asunder: apart

		Snuffle: (v) breathe noisily through the nose due to a cold or crying; (esp. of an animal) make repeated sniffing sounds as though smelling at something; (n) a sniff or sniffing sound; a cold or other infection that causes sniffing

		Jasper: an opaque reddish-brown semi precious stone consisting of a variety of chalcedony; a kind of fine hard porcelain developed by Josiah Wedgwood and used for Wedgwood cameos and other delicate work

		Chalcedony: a microcrystalline type of quartz occuring in several different forms including onyx and agate

		Carnelian: a semi-precious stone consisting of a dull red or reddish-white variety of chalcedony (quartz); a dull red color (kind of cinnamonish)

		Salacious: having or coveting undue or indecent interest in sexual matters; lewd, crude, suggestive, coarse, vulgar, ribald, bawdy, earthy, prurient

		Verisimilitude: the appearance of being true or real

		Vale: (n) a valley (used in place names or as a poetic term); a written or spoken farewell; (exclamation) farewell (ety: Latin meaning "be well" or "be strong"

		Arbor: (n) an axle or spindle in which something revolves; a device holding a tool in a lathe; a shady garden alcove with the sides and roof formed by trees or climbing plants trained over a framework; gazebo, pergola, retreat, sanctuary

		Lathe: (v,n) a machine for shaping wood, metal, or other material by means of a rotating drive which turns the piece being worked on against changeable cutting tools

		Propitiate: win or regain the favor of (a god, spirit, or person) by doing something that pleases them; appease, placate, mollify, conciliate, soothe, pour oil on troubled waters

		Jocose: playful or humorous

		Of old: in or belonging to the past; for a long time

		Quirt: (n) a short-handled riding whip with a braided leather lash; (v) hit with a quirt

		Nimble: quick and light in movement or action; agile, lithe, acrobatic, sprightly, fleet-footed, spry, supple, limber, lissom, fleet, dexterous, deft, adroit; (of the mind) able to think and understand quickly

		Browbeat: intimidate (someone) typically into doing something, with stern or abusing words; bully, hector, coerce, badger, bludgeon, oppress, tyrannize, subjugate, harass, harry, hound, goad

		Huff and puff: make noisy, empty threats

		Huff: (v) blow air out loudly on account of exertion; express one's feeling of petty annoyance; sniff fumes from (petroleum or solvents) for a euphoric effect; (n) a fit of petty annoyance; temper, tantrum, fury, rage, passion

		Puff: (n) a short, explosive burst of breath or wind; the sound of air or vapor escaping suddenly; a small quantity of vapor or smoke, emitted in one blast; an act of drawing quickly on a pipe or cigarette; a review of a work of art, book, or theatrical production, esp. an excessively complementary one; an advertisement, esp. one exaggerating the value of the goods advertised; a gathered mass of material in a dress or other garment; a rolled protuberant mass of air; an eiderdown; a powder puff; (v) breathe in repeated short gasps; move with short, noisy breaths or bursts of air or steam; (on) smoke a pipe or cigarette; blow (dust, smoke, or a light object) with a quick breath or blast of air; move through the air in short bursts; swell or become swollen; (up) be conceited; advertise with exaggerated or false praise

		Eiderdown: a quilt filled with down (originally from thei eider) or some other soft material; small soft feathers from the breast of a female eider

		Eider: a norther sea duck, of which the male is mainly black-and-white with a colored head, and the female brown

		Quilt: (n) a warm bed covering made if padding enclosed between layers of fabric and kept in place by lines of stitching, typically applied in a decorative design; duvet, conterpane, bedspread, comforter, puff, eiderdown; a duvet; a layer of padding used for insulation; (v) join together (layers of fabric or padding) with lines of stitching to form a bed covering, a warm garment, or for decorative effect

		Counterpane: a bedspread

		Down: (non exhaustive) (adv) to or at a place perceived as lower (often expressing casualness or lack of hurry) (eg: down at the villa); from an earlier to a later point in time of order (eg: down to 1540); (with) shouted to express strong dislike of a specified person or thing; (of sailing) with the current or the wind; (of a ship's helm) moved round to leeward so that the rudder is windward; (preposition) throughout (a period of time) (eg: down the ages); (a) directed or moving towards a lower place or position; unhappy or depressed; (v) knock or bring to the ground; consume (something), typically a drink; guzzle, quaff, ingurgitate; (n) soft, fine, fluffy feathers which form the first covering of a young bird or an insulating layer below the contour feathers of an adult bird; down feathers taken from ducks or their nests and used for stuffing cushions, quilts, etc,; fine, soft hair on the face or body of a person; short, soft hairs on some leaves, fruit, or seeds; a gently rolling hill; ridges of undulating chalk and limestone hills in southern England, used mainly for pasture

		Leeward: (a and adv) on or toward the side sheltered from the wind. Downwind; (n) the side sheltered or away from the wind

		Windward: (a and adv) facing the wind or on the side facing the wind; (n) the side or direction from which the wind is blowing

		Rudder: a flat piece hinged vertically near the stern of a boat or ship for steering; a vertical aerofoik pivoted from the tailplane of an aircraft, for controlling movement about the vertical axis; (full) application of a rudder I. Steering a boat, ship, or aircraft

		Helm: (n) a tiller or wheel for steering a ship or boat; a position of leadership; a helmsman; (v) steer (a boat or ship); manage (an organization); direct (a film)

		Draught: (n) a current of cool air in a room or ither confined space; waft, whiff, breath, breeze, puff, gust, gale, zephyr; a single act of drinking if inhaling; the amount swallowed of inhaled in a draught; a quantity of a liquid with medicinal properties; the depth of water needed to float a ship; the drawing in of a fish net; the fish taken at one drawing. A catch; (a) denoting beer or cider served from a barrel or tank; denoting an animal used for pulling heavy loads

		Draft: (n) a plan, sketch, preliminary piece of writing, or rough drawing; a written order to pay a specified sum; compulsory recruitment for military service; US spelling of draught (v) prepare a preliminary version; (in) select (a person  or group of people) for a certain purpose; conscript for military service

		Zephyr: a soft gentle breeze; a fine cotton gingham; a very light article of clothing

		Quaff: (v) drink (something, especially an alcoholic drink) heartily; (n) an alcoholic drink

		Tiller: (n) a horizontal bar fitted to the head of a boat's rudder post and used for steering; an implement for breaking up soil. a plough or cultivator; a lateral shoot from the base of the stem of a plant, esp. in a grass or cereal; (v) (of a plant) develop tillers

		Harangue: (n) a lengthy and aggressive speech; tirade, lecture, diatribe, homily, rant, fulmination, admonition, peroration, Phillipic, obloquy, declamation, exhortation, reprisal, invective, berating; (v) lecture (someone) at length in an agressive and critical manner; pontificate to, sermonize to, declaim to, berate, castigate, lambaste, upbraid, pillory

		Forestall: present or obstruct (an anticipated event or action) by taking advance action; pre-empt, thwart, foil, frustrate, avert, preclude, obviate; act in advance of (someone) in order to prevent them from doing something; buy up (goods) in order to profit by an enhanced price

		Shrew: a small mouse-like insectivorous mammal with a long pointed about and tiny eyes; a bad tempered or aggressively assertive woman; virago, termagant,  vixen, fish wife, hellcaf, tartar, spitfire, hag, gorgon, harridan, harpy, battleaxe

		Termagant: a harsh-tempered or overbearing woman; an imaginary deity of violent and turbulent character, often appearing in morality plays (try: name given to a God which christians believed Muslims worshipped

		Virago: a domineering, violent, or bad tempered woman; a woman of masculine strength or spirit. A female warrior (ety: Latin "vir" meaning "man")

		Hag: a witch; an ugly old woman; crone, gorgon

		Gorgon: each of the three sisters, Stheno, Euyale, and medusa, with snakes for hair and the power to turn anyone who looked at them to stone. Medusa was killed by Perseus; a fierce, frightening, or repulsive woman

		Vixen: a female fox; (informal) a spirited or quarrelsome woman

		Harridan: a strict, bossy, or belligerent old woman

		Crock: (n) an earthenware pot or jar; a broken piece of earthenware; a plate, cup, or other item of crockery; (v) injure (a person or part of the body)

		Crockery: plates, dishes, cups, and other similar items, esp. ones made of earthenware or china

		Hincty: conceited or snobbish

		Brood: (n) a family or birds or other young animals produced at one hatching or birth; a large family of children; bee or wasp larvae; (v) (over) think deeply about something that makes one unhappy, angry, or worried; languish over, moon over, mull over, dwell on, pore over, sulk over; (of a bird) sit on (eggs) to hatch them; (of a fish, frog, or invertebrate) hold (developing eggs) within the body; (a) (of an animal) kept to be used for breeding

		Moon: (v) (about) behave or move in a listless and aimless manner; fiddle, idle, loaf, drift; (over) act in a dreamily infatuated manner

		Pore: (v) (over) be absorbed in reading or studying (something); (on) think intently. Ponder

		Doltish: (of a person) stupid; idiotic, moronic, foolish, dull, witless, cretinous, vacuous

		Apparatchik: a member of a communist party apparat; (humorous) an official in a large political organization

		Apparat: the administrative system of a communist party; especially in a communist country

		Iliac: relating to the ilium or the nearby regions of the lower body

		Ilium: the large broad bone forming the upper part of each half of the pelvis

		Catullian: of, relating to, or like Catullus or his lyric poems, which are marked by facility of language, perfection of form, and intensely personal subject matter

		Pavor nocturnus: night/sleep terror

		Incondite: badly put together (eg: incondite prose)

		Recondite: (of a subject or knowledge) little known; abstruse

		Chador: a large piece of cloth that is wrapped around te head and upper body leaving only the face exposed, worn especially by Muslim women

		Preprandial: (humorous) done or taken before dinner or lunch (ety: Latin "preprandium" meaning "before a meal")

		Pharmacopoeia: an official publication containing a list of medicinal drugs with their effects and directions for their use; a stock of medicinal drugs

		Venery: sexual indulgence; hunting

		Incarnadine: (n) a bright crimson or pinkish-red color; (v) color (something) a bright crimson or pinkish red

		Eructation: a belch (ety: Latin ex+"ructare" meaning "belch")

		Halter: (n) a strap or rope placed around the head of a horse or other animal, used for leading or tethering it; a rope with a noose for hanging a person; a strap around the neck that holds a dress or top in place, leaving the shoulders and back bare; (v) put a halter on (an animal); hang (someone)

		Menarche: the first occurrence of menstruation

		Bellelettrist/belletrist: a writer of belles lettres, literary works that do not fall into other major categories, such as fiction, poetry, or drama, such as essays, récits, collections of speeches and letters

		Anent: (Scottish, archaic) concerning, about

		Forsooth: (humorous, archaic) indeed (often used ironically)

		Ribald: referring to sexual matters in an amusingly ride or irreverent way; bawdy, indecent, risque, rabelaisian, lewd, pornographic, naughty, obscene, coarse, salacious, smutty

		Coarse: rough or harsh in texture; prickly, shaggy, bristly; consisting of large grains or particles; (of grains or particles) large; (of a person's features) not elegantly formed or proportioned; (of food or drink) of inferior quality; (of a person or their speech) rude or vulgar; oafish, boorish, loutish, churlish, uncouth, discourteous, vulgar, uncivil

		Smutty: (of talk, writing, or pictures) obscene or lascivious

		Twinge: (n) a sudden, sharp localized pain; spasm, ache, throb, throe, cramp a brief experience of an emotion, typically an unpleasant one; pang, scruple, misgiving (v) (of a part of the body) suffer a sudden, sharp localized pain

		Fount: a source of a desirable quality or commodity; a spring or fountain

		By way of: so as to pass through or across. Via; constituting. As a form of; by means of

		Scrofulous: of, relating to, or affect with scrofula; having a diseased run-down appearance; morally contaminated

		Scrofula: a disease with glandular swellings, probably a form of tuberculosis

		Dross: something regarde as worthless; rubbish, junk, staff, debris, detritus, garbage; foreign matter, dregs, or mineral waste, in particular scum fined on the surface of molten metal

		Dregs: the remnants of liquid left in a container, together with any sediment; alluvium, precipitate, dross, sediment, residue, deposit; the most worthless part or parts of something; rabble, scum, refuse, vermine

		Execrate: feel or express great loathing for; revile, decry, condemn, vilify, abhor, excoriate, despise, anathemize; curse, swear

		Unaccountable: unable to be explained; unfathomable, incomprehensible, insoluble, puzzling, perplexing, mysterious, arcane, inscrutable, peculiar, curious, queer, bizarre, freak, freakish, unparalleled, obscure, abstruse, enigmatic, baffling,  bewildering; (of a person or their behavior) unpredictable and strange; (of a person, organization, or institution) not resulted or expected to justify actions or decisions. Not responsible for results or consequences

		Arcane: understood by few. Mysterious or secret; occult, cryptic, esoteric, recondite, abstruse, clandestine, obscure

		Abstruse: difficult to understand. Obscure; recondite, Delphic, involuted

		Delphic: relating to the Ancient Greek oracle at Delphi; deliberately obscure or ambiguous

		Involute: (a) involved or intricate; curled spirally; (of a shell) having the whorls wound closely round the axis; (of a leaf or te cape of a fungus) rolled inward at the edges; (n) the locus of a point considered as the end of a taut string being unwound from a given curve in the plane of that curve

		Whorl: (n) a pattern of spirals or concentric circles; loop, coil, curl, twirl, spiral, helix, convolution; each of the turns or convolutions in the shell of a gastropod or ammonoid mollusc; a set of leaves, flowers, branches springing from the stem at the same level and encircling it; (in a flower) each of the sets of organs, especially the petals and sepals, arranged concentricslly round the receptacle; a complete circle ina fingerprint; a small wheel or pulley in a spinning wheel, spinning machine, of spindle; (v) spiral or move in a twisted and convoluted fashion

		Baffle: totally bewilder or perplex; nonplus, mystify, bemuse, disconcert, discombobulate, faze, obfuscate; restrain or regulate (a fluid, sound, etc,); thwart, frustrate, fools, hinder, obstruct; (n) a device used to restrain the flow of a fluid, gas, etc. to prevent the spreading of sound or light in a particular direction

		Esoteric: intended for or likely to be understood by only a small number of people with a specialized knowledge or interest

		Stultify: cause to lose enthusiasm and initiative; esp. as a result of a tedious or restrictive routine; cause (someone) to appear foolish or absurd

		Buzzard: a large, hawklike bird of prey with broad wings and a rounded tail, often seen soaring in wide circles; a vulture, especially a turkey vulture

		Glean: obtain (information) from various sources, often with difficulty; derive, extract, cull, garner, reap; collect gradually; gather (leftover grain) after a harvest

		Cull: (v) reduce the population of (a wild animal) by selective slaughter; send (a wild animal) to be slaughtered; send (an inferior or surplus farm animal) to be slaughtered; select from a large quantity. Obtain from a variety of sources. Glean; pick (flowers or fruit); (n) a selective slaughter of animals

		Indignant: feeling or showing anger or annoyance at what is perceived as unfair treatment

		Banister: the structure formed by the uprights and handrail at the side of a staircase; a single upright at the side of a staircase; balustrade, handrail, railing

		Balustrade: a railing supported by balusters, especially one forming an ornamental parapet to a balcony, bridge, or terrace

		Parapet: a low protective wall along the edge of a roof, bridge, or balcony; a protective wall or earth defense along the top of a trench or other place of concealment for troops (ety: Latin "para + pectus" meaning "protecting + chest"); barricade, rampart, bulwark, embankment, bastion, bartizan

		Bartizan: also called an échauguette, a battlemented parapet or an overhanging corner turret at the top of a castle or church tower

		Battlement: a parapet at the top of a wall, especially of a fort or castle, that has regularly spaced squared openings for shooting through; a section of roof enclosed by battlements

		Shoe (shod, shod): (v only) fit (a horse) with a shoe or shoes; be wearing shoes of a specified kind; protect (the end of an object such as a pole) with a metal shoe; fit a tyre to (a wheel)

		Impudent: not showing due respect for another person; impertinent, brazen, cheeky, audacious, pert, presumptuous, disrespectful, flippant, bumptious, brash, bold, unmannerly, discourteous, contumelious

		Pert: (of a girl or young woman) attractively lively or cheeky; impudent or cheeky; (of a bodily feature or garment) attractively small and well shaped

		Bumptious: irritatingly self-assertive; conceited, arrogant, pompous, overbearing, imperious, affected, sententious, grandiose, vain, haughty, overweening, supercilious, condescending

		Brash: (a) self-assertive in a rude, noisy, or overbearing way; having an ostentatious or tasteless appearance; tawdry, garish, gaudy, vulgar; (n) loose broken rock or ice; clippings from hedges, shrubs, or other plants

		Davenport: (Brit) an ornamental writing desk with drawers and a sloping surface for writing; a large heavily upholstered sofa

		Supine: (a) (of a person) lying face upwards; recumbent, prostrate, spreadeagled, sprawling; (of the hand) with the palm upwards; failing to act or protest as a result of moral weakness or indolence; spineless, yielding, effete, docile, acquiescent, pliant, submissive (n) a Latin verbal noun used only in the accusative and ablative cases, especially to denote purpose

		Effete: affected, over-refined, and ineffectual; alembicated, flowery, precious, artificial, studied, pretentious; no longer capable of effective action; (of a man) weak or effeminate

		Pusillanimous: showing a lack of courage or determination; timid (ety: Latin "pusillus + animus" meaning "very small + mind")

		Distend: swell or cause to swell by pressure from inside; bloat, bulge, dilate, inflate, enlarge, tumefy, intumescent

		Corpuscles of Krause: any of various rounded sensory organs occurring in mucous membranes (as of the conjunctiva or genitals

		Cur: an aggressive or unkempt dog, especially a mongrel; a contemptible man

		Seraglio: the women's apartments (harem) in an ottoman palace; the women inhabiting a seraglio or harem; a Turkish or ottoman palace, especially the sultan's court and government offices at Constantinople

		Caravanserai: an inn with a central courtyard for travellers in the desert regions of Asia or North Africa; a group of people traveling together; a caravan

		Equipoise: (n) balance of forces or interests; equilibrium, symmetry, parity, poise; a counterbalance or balancing force; counterweight, counterpoise, ballast; (v) balance or counterbalance (something)

		Poise: (n) graceful and elegant bearing in a person; composure and dignity of manner; equanimity,  aplomb, sangfroid, collectedness, serenity, nerve, dignity; (v) be or cause to be balanced or suspended; be ready and prepared to do something

		Deportment: the way a person stands and walks, particularly as an element of etiquette; gait, posture, stance, bearing, comportment, demeanor, mien; a person's behavior or manners. Etiquette

		Ballast: (n) heavy material, such as gravel, sand, or iron, placed in the bilge of a ship to ensure its stability; a heavy substance carried in an airship or on a hot-air balloon to stabilize it and jettisoned when greater altitude is required; gravel or coarse stone used to form the bed of a railway track or the substratum of a road; a mixture of coarse and fine aggregate for making concrete; a passive component used in an electric circuit to moderate changes in current; (v) give stability to (a ship) by putting a heavy substance in its bilge; form (the bed of a railway line or the substratum of a road) with gravel or coarse stone

		Bilge: (n) the areas in the outer surface of a ship's hull where the bottom curves meet the vertical sides; (as "bilge water") dirty water that collects inside the bilges; nonsense, rubbish; (v) break a hole in the bolder of (a ship)

		Groin: the area between the abdomen and the upper thigh on either side of the body; a curved edge formed by two intersecting vaults

		Groyne: a low walk or sturdy timber barrier built out into the sea from a beach to check erosion and drifting

		Awry: away from the usual or expected course, amiss; out of the normal or correct position; askew, crooked, lopsided, agley, thrawn, misaligned

		Moll: a gangster's female companion; a prostitute

		Venereal: relating to sexual desire or sexual intercourse; relating to venereal disease (ety: Latin "Venus/vener" meaning "sexual love"

		Buccaneer: a pirate, originally one operating in the Caribbean; corsair, privateer, sea rover, marauder, swashbuckler; a person who acts in a recklessly adventurous and often unscrupulous way, especially in business

		Derring-do: (humorous) action displaying heroic courage

		Traipse: walk or move wearily or reluctantly; trudge, trek, plod, wade, clump, shuffle, footslog; walk about casually or needlessly

		Fascinus: in ancient Roman religion and magic, the embodiment of the divine phallus, or its effigies, amulets, or the spells used to invoke his divine protection

		Espy: catch sight of

		Wring (wrung, wrung): squeeze and twist (something) to force liquid from it; extract (liquid) by squeezing and twisting something; squeeze (someone's hand) tightly, especially with sincere emotion; obtain (something) with difficulty or effort; squeeze, elicit, coerce, wrench, extort, milk; break (an animal's neck) by twisting it forcibly; cause pain or distress to; rend, harrow, lacerate, rack, distress, torment; (n) an act of squeezing or twisting something

		Outlay : an amount of money spent on something

		Sapphic: (a) (humorous) relating to lesbians or lesbianism; relating to Sappho or her poetry; (n) verse in a mètre associated with Sappho (influential Greek poet from lesbos, usually associated with same-sex love, especially between two women)

		Toll: (sense 2 only) (v) sound or cause to sound with a slow, uniform succession of strokes, as a signal or announcement; (of a bell) announce or mark (the time, a service, or a person's death; chime (out) strike, peak, knell, resound, reverberate; (n) a single ring of a bell

		Hector: talk to (someone) in a bullying way; badger, intimidate, chivvy, harass, torment, strong-arm, dragoon, menace

		Solicitude: care or concern for someone or something

		Wistful: having or showing a feeling of vague or regretful longing; nostalgic, yearning, longing, plaintive, rueful, melancholy, mournful, forlorn,  disconsolate, woebegone, doleful, pensive, contemplative, meditative, dreamy, in a reverie

		Nugatory: of no value or importance; trifling, trivial, inconsequential, insignificant; useless or futile; unavailing, vain

		Escutcheon: a shield or emblem bearing a coat of arms; a flat piece of metal for protection and often ornamentation, around a keyhole, door handle, or light switch

		Disoblige: offend (someone) by not acting in accordance with their wishes

		Untoward: unexpected and inappropriate or inconvenient; inopportune, unwelcome, unfortunate, malapropos, unseasonable

		Stodgy: (Brit) (of food) heavy, filling, and high in carbohydrates; lumpy, leaden, starchy, indigestible; dull and uninspired, lacking in originality or excitement; dull, dreary, prosaic, staid, turgid, tedious, humdrum, monotonous, pedantic, plodding; (US) bulky or heavy in appearance

		Parlor: (n) a sitting room in a private house; a room in a public building for receiving guests; a room in a monastery or convent that is set aside for conversation; a shop or business providing specified goods or services (eg: an ice-cream parlor); a room or building equipped for milking cows; (a) denoting a person who professes belief in but does not actively support a specified (esp. radical) political view

		Specious: superficially plausible, but actually wrong; misleading in appearance, especially misleadingly attractive; sophistic, deceptive, fallacious

		Slump: (n,v) sit, lean, or fall heavily and limply; sink, subside, slouch, sag; undergo a sudden, severe or prolonged fall in price, value, or amount; plummet, plunge, tumble; (to) fail or decline substantially

		Abash: make (someone) feel embarrassed, disconcerted, or ashamed; mortified, nonplussed, discomfited, confounded, crestfallen, dismayed

		Presentiment: an intuitive feeling about the future, especially one of foreboding; premonition, foreboding, intuition, hunch, dread

		Raven: (n) a large heavily built crow with mainly black plumage, feeding chiefly on carrion; (a) (especially of hair) of a glossy black color; sooty, ebony, ebon, dusky, inky, sable

		Sable: (n) a marten with a short tail and dark brown fur, native to Japan and Siberia and valued for its fur; the fur of the sable; black; mourning garments; a large African antelope with long curved horns, the male of which has a black coat and the female a russet coat, both having a white belly

		Raffish: unconventional and slightly disreputable, especially in an attractive way; rakish, jaunty, dapper, dashing, devil-may-care, louche

		Ewer: a large jug with a wide mouth, formerly used for carrying water

		Abominate: detest, loathe

		Manumission: the act of a slave owner freeing his own slaves

		Usurer: a person who lends money at unreasonably high rates of interest

		Drawl: (v) speak in a slow, lazy way with prolonged vowel sounds; (n) a slow, lazy way of speaking or an accent with prolonged vowel sounds

		Bevy: a large group of people or things of a particular kind; a group of roe deer, quails, or larks

		Burlap: coarse canvas woven from jute, hemp, or a similar fibre, used especially for sacking; lighter material of a kind similar to burlap, used in dressmaking and furnishing

		Frond: the leaf or leaf-like part of a palm, fern, or similar plant (ety: Latin meaning "leaf")

		Conspiratorial: relating to or suggestive of a secret plan made by a group of people to do something unlawful of harmful; (of a person's manner or behavior) suggesting that they share secret knowledge with another person

		Tripe: the first or second stomach of a cow or other ruminant used as food

		Frump: an unattractive woman who wears dowdy old-fashioned clothes

		Twine: (n) string thread or string consisting of two or more strands of hemp or cotton twisted together; (v) wind or cause to wind round something; entwine, wrap, lace, wreathe; interlace; coil, loop, twist, spiral, curl, snake; weave, interweave, intertwine, plait, braid, twist

		Sprig: (n) a small stem bearing leaves or flowers, taken from a plant; a descendant or younger member of a family or social class; (derogatory) a young man; a small moulded decoration applied to a piece of pottery before firing; (v) decorate (pottery) with small, separately moulded designs

		Rectitude: morally correct behavior or thinking; righteousness, virtue, honor, integrity, probity, equity, decency, ethics, principles

		Probity: the quality of having strong moral principles; honesty and decency (ety: Latin "probitas" meaning "good")

		Mite: a minute arachnid which has four pairs of legs when adult, related to the ticks; a small child or animal, especially when regarded as an object of sympathy; a very small amount; a small coin, in particular a small Flemish copper coin of very low face value; (adv, informal) a little. Slightly

		Frugal: sparing or economical as regards money or food; simple and plain and costing little

		Climacteric: (n,a) a critical period or event; the period of life when fertility and sexual activity are in decline; (in women) menopause; the ripening period of certain fruits such as apples, involving increased metabolism and only possible while still on the tree

		Revolting: causing intense disgust. Disgusting

		Scrawl: (v,n) write (something) in a hurried, careless way; scribble, doodle, jot (down), dash (off)

		Strain: (v) force (a part of one's body or oneself) to make an unusually great effort; make an unusually great effort; injure (a limb, muscle, or organ) by overexerting it; make severe or excessive demands on; overburden, overwork; pull or push forcibly at something; pull, tug, heave, haul; stretch  (something) tightly; embrace (someone) tightly; pour (a mainly liquid substance) through a porous device or material in order to separate out any solid matter; cause liquid to drain off (food) by using a porous or perforated device; sieve, sift, riddle, screen, percolate; (off) drain (liquid) off food; (n) a force tending to pull or stretch something to an extreme or damaging degree; an injury to a part of the body caused by overexertion; the magnitude of a deformation, equal to the change in the dimension divided by the original dimension; the sound of a piece of music; tune, melody, air

		Potter: (v,n) occupy oneself in a desultory but pleasant way; (v) move or go in a casual, unhurried way; amble, wander, meander, stroll, saunter, maunder; (n) a person who makes ceramic ware

		Prevarication: speak or act in an evasive way

		Yeoman: a man holding and cultivating a small landed estate; a freeholder; a person qualified for certain duties and rights, such as to serve in a jury and vote got the knight of the shire, by virtue of possessing free land of an annual value of 40 shillings; a servant in a royal or noble household, ranking between a sergeant and a groom or a squire and a page; a member of the yeomanry force (cavalry force raised from the yeomanry (Brit, 1794-1908); a petty officer in the navy concerned with signaling (UK) or performing clerical duties (US)

		Hogarthian: relating to or characteristic of the English painter and engraver William Hogarth (1697-1764) credited with pioneering western sequential art) or his satirical political illustrations

		Fathom: (n) a unit of length equal to six feet (1.8 meters), chiefly used in reference to the depth of water; (v) (out) understand (a difficult problem or an enigmatic person) after much thought; divine, penetrate, puzzle out, untangle, unravel, cognize; measure the depth of (water); sound, plumb, probe, gauge, estimate

		Plumb: measure (the depth of a body of water); (of water) be if a specified depth; ("the depths of") explore or experience fully or to extremes; test (an upright surface to determine the vertical; (n) a ball of lead or other heavy object attached to the end of a line for finding the depth of water or determining the vertical on an upright surface; (a) vertical

		Quibble: (n) a slight objection or criticism; a play on words, a pun; (v) argue or raise objections about a trivial matter; split hairs, carp about, cavil at; equivocate, prevaricate, hedge

		Corral: (v) gather together and confine (a group of people or things); put or keep (livestock) in a corral; form (wagons) into a corral; (n) a pen for livestock, especially cattle or horses, on a farm or ranch; pen, fold, compound, stockade, paddock, kraal, Potrero; a defensive enclosure formed of wagons in an encampment

		Pen: (n) a writing tool; the occupation of writing; the tapering cartilaginous internal shell of a squid; a small enclosure in which sheep, pigs, or other farm animals are kept; paddock, compound, sty, stall, fold, corral; a number of animals in or sufficient to fill a pen; any small enclosure in which someone or something can be confined; a covered dock for a submarine or other warship; (in the West Indies) a farm or plantation; a female swan; (v) write of compose; put or keep (an animal) in a pen; confine someone to a restricted space

		Stockade: (n) a barrier formed from upright wooden posts or stakes, especially as a defense against attacks or as a means of confining animals; an enclosure bound by a stockade; a military prison; (v) enclose (an area) by erecting a stockade

		Paddock: (n) a small field or enclosure where horses are kept or exercised; field, meadow, pasture, yard, pen, stockade; an enclosure adjoining a racecourse or track where horses or cars are gathered and displayed before a race; (v) keep (a horse) in a paddock

		Meadow: a piece of grassland, especially one used for hay; a piece of low ground near a river

		Lea: an open area of grassy or arable land

		Mead: an alcoholic drink of fermented honey and water; a meadow

		Kraal: (South African, n) a traditional African village of huts, typically enclosed by a fence

		Potrero: (in the south western US and South America) a paddock or pasture for horses or cattle

		Fretful: feeling or expressing distress or irritation; upset, miserable, unsettled, distraught, overwrought, restive, fidgety,

		Distraught: very worried and upset; fraught, overwrought, devastated, deranged, hysterical

		Ramble: (v) walk for pleasure in the countryside; wander, stroll, amble, drift, roam, rove, peregrinate; talk or write at length in a confused or inconsequential way; chatter, babble, prattle, blather, jabber, maunder, drivel; (of a plant) put out long shoots and grow over walls or other plants; (n) a walk taken for pleasure in the countryside

		Cornice: an ornamental moulding round the wall of a room just below the ceiling; a horizontal moulded projection crowning a building or structure, especially the uppermost member of the entablature of an order, surmounting the frieze; an overhanging mass of hardened snow at the edge of a mountain precipice

		Last Trump: the trumpet blast that in some religious beliefs is thought will wake the dead on judgement day

		Bounderish: lacking refinement or grace

		Hoar: (a) greyish white. Grey or grey haired with age; (n) hoar frost

		Hoar-frost: a greyish white crystalline deposit of frozen water vapor formed in clear still weather in vegetation, fenced, etc.; frost, time, verglas

		Rime: (n) frost formed on cold objects by the rapid freezing of water vapor in cloud or for; (v) cover (an object) with rime

		Amiss: (a) not quite right; inappropriate or out of place; awry, astray, adrift; (adv) wrongly or inappropriate

		Astray: (adv) away from the correct path or direction; into error or morally questionable behavior

		Adrift: (of a boat or its passengers) drifting; without purpose, direction, or guidance

		Transept: (in a cross shaped church) either of the two parts forming the arms of the cross shape

		Coffer: a strongbox or small chest for holding valuables; the funds or financial reserves of an organization; a decorative sunken panel in a ceiling

		Mold: (n) a hollow container to give shape to molten or hot liquid material; a pudding or savory mousse made in a mould; (v) form (an object) out of malleable material; give shape to (malleable material); influence the formation or development of; (of a column, ceiling, or other part of a building) having a decorative moulding

		Mound: (n) a rounded mass projecting above a surface; a small hill; hillock, knoll, embankment, bank, dune, ridge, acclivity, trump, butte; a raised mass of earth and stones created for purposes of defense or burial; a large pile of something; heap, stack, pyramid, mountain; (v) heap up into a rounded pile; enclose or fortify with an embankment

		Acclivity: an upward slope

		Great helmsman: Mao Zedong

		Lupine: of, like, or relating to a wolf or wolves

		Lupin: a plant of the pea family with deeply divided leaves and tall colorful tapering spikes of flowers

		Tubby: (informal) short and rather fat; plump, portly, rotund, ample, corpulent; (of a sound) lacking resonance. dull (as that of a tub when struck)

		Graft: (v,n) insert a shoot or twig into a slit on the trunk or stem of a living plant, from which it receives sap; insert a graft on (a trunk or stem); transplant (living tissue); make money through bribery of other corrupt practices used to secure illicit advantages or gains in politics or business

		Subserve: help go further or promote

		Pram: a baby carriage; stroller, pushcart, perambulator; a flat bottomed sailing boat

		Mew: (v,n) (of a cat or gull) make a characteristic high pitched crying noise; screech, miaow, mewl, squawk; (n) a cage it building for trained hawks,  especially while they are molting; (v) (of a trained hawk) molt; confine (a trained hawk) to a cage or building while molting; confine (someone) in a restricting place or situation

		Totter: (n, v) move in a feeble or unsteady way; wobble, teeter, stagger, stumble, dodder, shuffle, shamble, falter,   reel, lurch, hobble, sway, roll; (v) (of a building) shake or rock as if about to collapse; shake, quiver, shudder, judder, reel, lurch, vibrate,  oscillate; be insecure or about to fail

		Ramrod: a rod for ramming down the charge of a muzzle-loading firearm; used in similes and metaphors to describe an erect or rigid posture (eg: ramrod straight); a foreman or manager, esp. one who is a strict disciplinarian; (v) force a proposed measure to be accepted or completed swiftly

		Misprision: the deliberate concealment of one's knowledge of a treasonable act of a felony; failure to appreciate or recognize the value or identity of something

		Caboose: a railway wagon with accommodation for the train crew, typically attached to the end of the train; a kitchen on a ship's deck

		Cosset: care for and protect in an overindulgent way; pamper, indulge, pander to, coddle, spoil

		Stucco: (n) a fine plaster used for coating wall surfaces or moulding into architectural decorations; (v) coat or decorate with stucco

		Gaberdine: a smooth, durable, twill-woven worsted or cotton cloth; a raincoat made of gaberdine; a long, loose upper garment, worn particularly by jews

		Worsted: a fine smooth yarn spun form combed long-staple wool; fabric made form worsted yarn, having a close-textured surface with no nap

		Worst: (as v) get the better of; defeat, beat, best, trounce, rout, vanquish, conquer, overcome, overpower, subdue, subjugate, surpass, outclass

		Nap: the raised hairs or threads o the surface of fabric or suede leather, in terms of the direction in which they naturally lie

		Osmote: to move by osmosis

		Osmosis: a process by which molecules of a solvent tend to pass through a semi-permeable membrane from a less concentrated solution into a more concentrated one; the process of gradual or unconscious assimilation of ideas, knowledge, etc.

		Cumbrous: literary term for cumbersome

		Glut: an excessively abundant supply of something; excess, surplus, superfluity, nimiety; (v) supply or fill to excess; saturate, inundate, flood, deluge, overload, overfill, clog, swamp; satisfy fully

		Nimiety: the state of being more this is necessary or desirable; excess (ety: Latin "nimis" meaning "too much")

		Chasten: (of a reproof or misfortune) have a moderation of restraining effect on; humble, subdue, cow, squash, deflate; (especially of God) discipline, punish

		Mottle: (v) mark with spots or smears of color; speckled, streaky, marbled, dappled, jaspe, blotchy; (n) an irregular arrangement of spots or patches of color; a spot or patch forming part of a mottled arrangement

		Surfeit: (n) an excessive amount of something; excess, surplus, abundance, superfluity, glut; an illness caused or regarded as being caused by excessive eating or drinking; (v) cause (someone) to desire no more of something as a result of having consumed or done it to excess; satiate, gorge, glut, overfill, stuff, cram; (on) consume too much of something

		Disconsolate: very unhappy and unable to be comforted; woebegone, doleful, dejected, downcast, crestfallen, dispirited, despondent, forlorn, wretched, glum, gloomy, in the doldrums, melancholy, dolorous

		Astrakhan: the dark curly fleece of young karakul lambs from Central Asia; a fabric imitating astrakhan

		Burlesque: (n) an absurd or comically exaggerated imitiation of something, esp. in a literary or dramatic work. A parody; caricature, travesty, pastiche, satire, lampoon; a variety show, typically including striptease; (v) parody or imitate in an absurd or comically exaggerated way

		Crapulent: relating to he drinking of alcohol or drunkenness (ety: Latin "crapula" meaning "inebriation")

		Consumptive: (a) affected with a wasting disease, especially pulmonary tuberculosis; (derogatory) relating to the using up of resources; (n) a person with a wasting disease, especially pulmonary tuberculosis

		Mantilla: (in Spain) a lace or silk scarf worn by women over the head and shoulders

		Siphon: (n) a tube used to convey liquid upwards from a reservoir and then down to a lower level of its own accord. Once the liquid has been forced into the tube, typically by suction or immersion, flow continues unaided; a tubular organ in an aquatic animal, esp. a mollusk, through which water is drawn in or expelled; (v) draw off or convey (liquid) by means of a siphon; draw off or transfer over a period of time, esp. illegally or unfairly

		Winsome: attractive or appealing in a fresh, innocent way; engaging, darling, enchanting, captivating, fetching

		Trundle: (v,n) (with reference to a wheeled vehicle or its occupants) move or cause to move slowly and heavily; (of a person) move heavily and slowly

		Latch: (n) a metal bar with a catch and lever for fastening a door or gate; a spring lock for an outer door which catches when the door is close and can only be opened from the outside with a key; the part of a knitting machine needle which closes or opens to hold or release the wool; a circuit which retains whatever output state results from a momentary input signal until reset by another signal; (v) fasten (a door or gate) with a latch; secure, bar, bolt, lock, padlock, deadlock; (of a device) become fixed in a particular state

		Heather: a purple-flowered Eurasian heath that grows abundantly on moorland and heathland. Many ornamental varieties have been developed

		Censorious: severely critical of others

		Patina: a green or brown film on the surface of bronze or similar metals, produced by oxidation over a long period; a gloss of sheen on wooden furniture produced by age and polishing; the impression or appearance of something (eg: he carries the patina of old money and good breeding)

		Subfusc: (a) dull. Gloomy; (n) the dark formal clothing worn for examinations and formal occasions at some universities

		Straitened: characterized by poverty; penniless, destitute, penurious, impecunious, necessitous, beggarly, without a sou

		Bluster: (v) talk in a loud, aggressive, or indignan way with little effect; (of a storm, wind, or rain) blow or beat fiercely and noisily; blast, gust, storm, roar; (n) loud, aggressive, or indignant talk with little effect

		Dago: (offensive) a Spanish, Portuguese, or Italian-speaking person

		Debase: reduce (something) in quality or value; degrade, undermine, prostitute, tarnish, blemish, demean; lower the moral character of (someone); lower the value of (coinage) by reducing the content of precious metal

		Livery: a special uniform worn by a servant, an official, or a member of a city company; regalia, attire, dress, habit, garb, raiment, finery, garments, ensemble; a special design and color scheme used on the vehicles, aircraft, or products of a particular company; a provision of food or clothing for servants; (UK) the members of a city company collectively

		Hound: (n) a dog of a breed used for hunting, especially one able to track by scent; a person eagerly seeking a specified thing; a despicable or contemptible man; (v) harass, persecute, or pursue relentlessly; pester, badger, annoy, torment, bedevil

		Soapsud: another name for suds

		Sud: (n) froth made from soap and water; lather, foam, fizz, effervescence, spume; beer; (v) lather, cover, or wash in soapy water; form suds

		Spume: (n) froth or foam, especially that found on waves; surf, spray, mousse, spindrift, lather, suds; (v) form or produce a mass of froth or foam

		Spindrift: spray blown from the crests of waves by the wind; driving snow or sand

		Lather: (n) a frothy white mass of bubbles produced by soap, washing powder, etc. when mixed with water; heavy sweat visible on a horse's coat as a white foam; (v) form or cause to form a lather; rub soap onto (the body) until a lather is produced; (of a horse) be or become covered with sweat; spread (a substance) thickly or liberally; cover (something) with liberal amounts of a substance

		Diaphoretic: (chiefly of a drug) inducing perspiration; (of a person) sweating heavily

		Hidrosis: the action of sweating

		Tumble: (v,n) fall suddenly, clumsily, or headlong; move or rush in a headlong or uncontrolled way; scurry, scuttle, rush, scramble; cascade, stream, pour, spill; rumple. Disparage; tousle, dishevel, ruffle; perform acrobatic feats, typically handsprings and somersaults in the air; (of a breed of pigeon) repeatedly turn over backwards in flight; fall rapidly in amount or value; dry (washing) in a tumble dryer; have sexual intercourse with

		Scramble: (v) make one's way quickly or awkwardly up a steep gradient or over tough ground by using one's hands as well as one's feet; clamber, climb, crawl, scrabble; move hurriedly or clumsily from or into a particular place or position; put (clothes) in hurriedly; struggle or compete with others for something in an eager or uncontrolled and undignified way; jostle, scuffle, scrimmage, tussle, strive, contend; order (a fighter aircraft or its pilot) to take off immediately in an emergency or for action; (of a fighter aircraft or its pilot) take off immediately for emergency action; make (something) jumbled or muddled; make (a broadcast transmission or telephone conversation) unintelligible unless received by an appropriate decoding device; (n) a difficult clamber; a mountain walk up steep terrain involving the use of one's hands; an eager or undignified struggle; an emergency take off; a disordered mixture of something

		Surplice: a loose white linen vestment varying from hip-length to calf-length, worn over a cassock by clergy and choristers at Christian church services

		Abroad: in or to a foreign country or countries; in different directions. Over a wide area; (of a feeling or rumor) widely current; freely moving about

		Lope: walk or run with a bounding stride

		Footle: engage in fruitless activities; mess about

		Mull: (v) (over) think about (something) deeply and at length; ponder, contemplate; ruminate over, cogitate on, brood on; warm (an alcoholic drink, especially wine or beer) and add sugar and spices to it; (n) thin, soft, plain muslin, used in bookbinding for joining the spine of a book to its cover

		Claret: a red-wine from Bordeaux; a deep purplish-red color; blood

		Bibulous: excessively fond of drinking alcohol

		Priggish: self-righteously moralistic and superior; holier-than-thou, smug, sanctimonious, moralistic, sententious, puritanical, prim, Victorian, censorious, pecksniffian, pharisaic

		Picksniffian: affecting benevolence or high moral principles (ety: from mr pecksniff, a character in Dickens' Martin chuzzlewit

		Plover: a short-billed gregarious wading bird; typically found by water but sometimes frequenting grassland, tundra, and mountains

		Jumble: (n) an untidy collection or pile of things; confused heap, clutter, muddle, mess, welter, disarray, tangle, litter; (v) mix up in a confused or untidy way

		Maven: an expert or connoisseur

		Swarthy: dark-complexioned; dusky, saturnine, olive-skinned, swart

		Sweater: a knitted garment; an employer who works employees hard in poor conditions for low pay

		Chivvy: (Brit) tell (someone) repeatedly to do something; nag, badger, hound, harass, harry, pester, torment, annoy, goad, urge, prod, pressure

		Stoat: (French: hermine) a small carnivorous mammal of the weasel animal native to both Eurasia and North America, possessing a chestnut coat turning white in winter

		Boscage: a mass of trees and shrubs

		Drugget: a coarse woven fabric used to make floor coverings; a floor covering made of drugget

		Linoleum: a material consisting of a canvas backing thickly coated with a preparation of linseed oil and powdered cork, used especially as a floor covering

		Sacerdotal: relating to priests or the priesthood. priestly; relating to or denoting a doctrine which ascribes sacrificial functions and spiritual or supernatural powers to ordained priests

		Oleograph: a print textured to resemble an oil painting

		Bulrush: a tall reed-like water plant with strap-like leaves and a dark brown velvety cylindrical head of of numerous tiny flowers; (in biblical use) a papyrus plant; another term for clubrush, a tall rush-like water plant of the sedge family

		Pampas: large treeless plains in South America

		Baize: a coarse felt-like woollen material that is typically green, used for covering billiard and card tables and for aprons

		Sill: a shelf or slab of stone, wood, or metal at the foot of a window opening or doorway; a strong horizontal beam forming a base in the frame of a timber-framed building; each of the lower horizontal members of the frame of a cart or motor or rail vehicle; a tabular sheet of igneous rock intruded between and parallel with the existing strata; an underwater ridge or rock ledge extending across the bed of a body of water

		Igneous: (of rock) having solidified from lava or magma; relating to or involving volcanic or plutonic processes; of fire. Fiery

		Plutonic: relating to or denoting igneous rock formed by solidification at considerable depth beneath the earth's surface; relating to the underworld or the God Pluto (hades)

		Bassackwards: euphemistic spoonerism as alteration of assbackwards

		Effusive: showing of expressing gratitude, pleasure, of approval in an unrestrained or heartfelt manner; gushy, fulsome, lavish, enthusiastic, lyrical, ebullient, verbose, profuse; (of igneous rock) poured out when molten and later solidified; relating to the eruption of large volumes of molten rock

		Cummerbund: a sash worn around the waist, especially as part of a man's formal evening suit

		Pollyannaish: putting a positive spin on everything, even things that call for sadness or discouragement (ety: from a 1913 children's book by Eleanor H Porter called Pollyanna, about a young girl who tries to find something positive in every situation, which she calls "the Glad Game")

		Bespectacled: wearing glasses

		Poleax: (n) a battle axe; a butcher's axe with a hammer head at the back, used to slaughter animals; (v) hit, kill, or knock down with or as if with a poleaxe; cause great shock to

		Delouse: treat (a person or animal) to rid them of live and other parasitic insects

		Hinterland: the remote areas of a country away from the coast or the banks of major rivers; the area around or beyond a major town or port; an area lying beyond what is visible or known

		Malinger: pretend to be ill in order to escape duty or work

		Daisy: a small European grassland plant which has flowers with a yellow disc and white rays (ety: "day's eye" because the flower opens in the morning and closes at night

		Mawkish: sentimental in an exaggerated or false way; lachrymose, maudlin, saccharine, syrupy, nauseating

		Nonce: (of a word or expression) coined for one occasion; (Brit) a person convicted of a sexual offense, especially against a child

		Nigh: near; (on) almost (eg: a car weighing nigh on two tons); roughly, approximately

		Lentigo: a condition marked by small brown patches on the skin, typically in elderly people

		Plumbaceous: consisting of or resembling lead; having a dull gray color like that of lead; of the color lead; (of a ceramic object) finished or treated with a lead glaze

		Gingham: lightweight plain-woven cotton cloth, typically checked in white and a bold color

		Inly: inwardly

		Backfisch (plu: backfische): a teenage or late-adolescent girl (no longer a child but not yet a woman, stresses innocence) (ety: German term for "teenage girl" literally meaning "fish for baking")

		Schoolmarm: a schoolmistress (typically used with reference to a woman regarded as prim, strict, and brisk in manner)

		Inexorable: impossible to stop or prevent; inevitable, irrevocable; (of a person) impossible to persuade; unrelenting, intransigent, unbending, unyielding, unwavering, adamant, obdurate, inflexible, rigorous, draconian, stringent

		Enfold: surround; envelope, swathe, sheathe, cocoon, shroud, veil, cloak, swaddle, enshroud, mantle, pave, lap, pall, obnubilate; hold or clash (someone) lovingly in one's arm; embosom, cradle, embrace, cuddle

		Pall: (n) a cloth spread over a coffin, hearse, or tomb; a dark cloud of smoke, dust, etc.; something regarded as enveloping a situation with an air of gloom or fear; mar, blight, cloud, cast a shadow over; an ecclesiastical pallium

		Hearse: a vehicle for conveying the coffin at a funeral

		Engulf: (of a natural force) sweep over (something) so as to surround or cover it completely; eat or swallow (something) whole; powerfully affect (someone); overwhelm, flood, deluge, submerge, bury, overtake

		Antemeridian: before noon

		Sportive: playful. light-hearted; amorous, lustful; relating to, interested in, or good at sport

		Chortle: (n,v) laugh in a noisy, gleeful way

		Insensate: lacking physical sensation; lacking sympathy or compassion. unfeeling; completely lacking sense or reason

		Flame flower: a plant of the genus kniphofia having long grasslike leaves and tall scapes of red or yellow drooping flowers

		Flay: strip the skin off (a corpse or carcass); excoriate; strip (the skin) off a corpse or carcass; whip or beat (someone) so harshly as to remove their skin; criticize severely and brutally; pillory, castigate, lambaste, crucify, excoriate, savage, berate

		Callipygean: having well-shaped buttocks (ety: Greek "kallos + puge" meaning "beauty + buttocks", used to describe a famous statue of Venus

		Gonad: an organ that produces gametes; a testis or ovary

		Opal: a gemstone consisting of a quartz-like form of hydrated silica, typically semi-transparent and showing many small points of shifting color against a pale or dark ground

		Neuralgia: intense, typically intermittent pain along the course of a nerve, especially in the head or face

		Akimbo: (adv) with hands on the hips and elbows turned outwards; (with reference to limbs) flung out widely or haphazardly

		Clathrate: a compound in which molecules of one component are physically trapped with the crystal structure of another

		Gibber: speak rapidly and unintelligibly, typically through fear or shock; prattle, babble, drivel, jabber, patter, gabble, burble, twitter, flannel, mutter, mumble, maunder, prate, cackle

		Dab: (v) press against (something) lightly several times with a piece of absorbant material in order to clean or dry it or to apply a substance; apply (a substance) with light quick strokes; stipple, blot, pat, daub, apply; (n) a small amount of something; a brief application of a piece of absorbant material to a surface

		Daub: (v) carelessly coat or smear (a surface) with a thick or sticky substance; paint (words or drawings) on a surface in a careless or clumsy way; (n) a patch or smear of a thick or sticky substance; a painting executed without much skill; plaster, clay, or another substance used for coating a surface, especially when mixed with straw and applied to laths or wattles to form a wall

		Skedaddle: depart quickly or hurriedly; run away

		Exertion: physical or mental effort; the application of force, influence, or quality

		Cataract: a large waterfall; a sudden rush of water. A downpour; a medical condition in which the lens of the eye becomes progressively opaque, resulting in blurred vision

		White-water: fast shallow stretches of water in a river

		Phlegm: the thick viscous substance secreted by the mucous membranes of the respiratory passages; (in medieval science and medicine) one of the four bodily humors, believed to be associated with a calm, stolid, or apathetic temperament; calmness of temperament; sangfroid, equanimity, Serenity, tranquility, stolidity

		Condole: express sympathy for (someone); grieve with

		Smut: (n) a small flake of soot or other dirt or a mark left by one; a fungal disease of cereals in which parts of the war change to black powder; obscene or lascivious talk, writing, or pictures; (v) mark with flakes or soot or other dirt; infect (a plant) with smut

		Inter (dis): place (a corpse) in a grave or tomb, typically with funeral rites

		Exhume: dig out (something buried, esp. a corpse) from the ground; disinter, unearth, disentomb, ungrave; expose (a land surface) that was formerly buried

		Intervene: take part in something so as the prevent or alter a result or course of event; (of an event or circumstance) occur as a delay or obstacle to something being done; befall, betide, ensue, occur, arise, come about, materialize; occur in the time between events; be situated between thing (eg: they heard the sound of distant gunfire, muffled by the intervening trees

		Gurgle: (v,n) make a hollow bubbling sound like that made by water running out of a bottle; plash, splash, burble, purl, trickle, lap; (of a liquid) run or flow with a gurgling sound; (of a baby) make a contented sound

		Purl: (v) a cord of twisted gold or silver wire used for bordering or edging something; an ornamental edging of love or ribbon; a knitting stitch made by putting the needle through the front of the stitch from right to left; (v) knit with a purl stitch; (v,n) (of a stream or river) flow with a swirling motion and babbling sound

		Plash: (n) a splashing sound; a pool or puddle; (v) make a splashing sound; strike the surface (of water) with a splashing sound; bend down and interweave (branches and twigs) to form a hedge; make or renew (a hedge) by bending and interweaving branches and twigs

		Derelict: (a) in very poor condition as a result of disuse and disregard; dilapidated, decrepit, ramshackle, in ruins, forsaken; shamefully negligent of one's duties or obligations; remiss, lax, neglectful; (n) a person without a job, home, or property; a ship or other piece of property abandoned by the owner and in poor condition

		Addle: (a,v) (humorous) make (someone) unable to think clearly; confused, muddled,  fuddled, bewildered, dazed, discombobulated; (of an egg) become rotten, producing no chick

		Scathe: (archaic) (v,n) harm, injure; damage or destroy by fire or lightning

		Meld: (v,n) blend, combine

		Dowdy: (of a person or their clothes) unfashionable and unstylish in appearance (typically used of a woman); drab, frumpy, outmoded, inelegant, frowzy, dingy

		Adorn: make more beautiful or attractive; embellish, enhance, grace, enrich, bedeck, swathe, wreathe, festoon, garland, array, emblazon, gild, bedizen, bejewel, caparison, furbelow

		Conniption: a fit of rage or hysterics

		Pandemonium: wild and noisy disorder or confusion; uproar (ety: from Milton's paradise lost, denoting the place of "all demons")

		Inveterate: having a particular habit, activity, or interest that is long-established and unlikely to change; ingrained, deep-seated, entrenched, congenital, irredeemable; (of a feeling or habit) long-established and unlikely to change; chronic, incorrigible, compulsive, staunch, steadfast

		Redolent: strongly reminiscent or suggestive of; evocative; strongly smelling of; fragrant or sweet-smelling

		Jostle: (v,n) push, elbow, or bump against (someone) roughly, typically in a crowd; jolt, shove, hustle, thrust; struggle or compete forcefully for; vid, jockey, scramble

		Expound: present and explain (a theory or idea) in detail; delineate, recount, propound, advance, proffer, set forth; explain the meaning of (a literary or doctrinal work)

		Finesse: (n) impressive delicacy and skill; dash, panache, flair, artistry, virtuosity; great subtelety and tact in handling or manipulating people or difficult situations; discernment, judgement, sophistication, savoir faire, couth; (n,v) (in bridge and whist) an attempt to win a trick with a card that is not a certai winner, typically by playing it as the third card in a trick in the hope that any card that could beat it is in the hand of the opponent who had already played; (v) bring about or deal with (something) by using great delicacy and skill; slyly attempt to avoid blame or censure when dealing with (a situation or problem)

		Panache: flamboyant confidence of style or manner; élan, flair, dash, flourish, verve, zest, brio, éclat, vigor, gusto; a tuft or plume of feathers, especially as a headdress or on a helmet

		Plume: (n) a long, soft feather or arrangement of feathers used by a bird for display or worn by a person for ornament; a long cloud of smoke or vapor resembling a feather as it spreads from its point of origin; a mass of material, typically a pollutant, spreading from a source; a localized column of hotter magma rising by convection in the mantle, believed to cause volcanic activity in locations away from plate margins; (v) spread out in a shape resembling a feather; decorate with or as if with feathers; (of a bird) preen itself; (on) feel a great sense of self-satisfaction about something

		Toot: (v,n) sound (a horn or similar) with a short sharp sound; cocaine

		Gruff: (of a voice) rough and low; hoarse, harsh, gluttural, gravelly, raspy; abrupt or taciturn in manner; laconic, churlish, ill-natured, ungracious, rude, crabby

		Doddle: (Brit, informal) a very easy task

		Chomp: (v,n) munch or chew noisily or vigorously

		Honk: (n) the cry of a wild goose; he harsh sound of a car horn; (v) make or cause to make a honk

		Sty: a pigsty

		Pigsty: a pen or enclosure for a pig or pigs; a very dirty or untidy house or room

		Footling: trivial and irritating; trifling, petty, insignificant, paltry, hair-splitting, nugatory

		Joist: a length of timber or steel supporting part of the structure of a building, typically arranged in parallel series to support a floor or ceiling

		Dole: (n) a charitable gift of food, clothes, or money; a person's lot or destiny; sorrow, mourning; a flock of doves; (v) distribute shares of something;

		Lorry: a large, heavy motor vehicle for transporting goods or troops; a truck

		Beech: a large tree with smooth grey bark, glossy leaves, and hard, pale fine-grained timber; the timber of the beech

		Weir: a low dam built across a river to raise the level of water upstream or regulate its flow; an enclosure of stakes set in a stream as a trap for fish

		Waif: a homeless, neglected, or abandoned person, esp. a child; a person who appears thin or poorly nourished; an abandoned pet animal

		Jamb: a side post or surface of a doorway, window, or fireplace; frame, doorpost

		Flare: (n) a sudden brief burst of bright flame or light; glare, blaze, dazzle, burst; a device producing a very bright flame, used esp. as a signal or marker; a sudden burst of intense emotion; bout, spasm, access; a sudden recurrence of an inflammation or other medical condition; a sudden explosion in the chromosphere and corona of the sun or another star, resulting in an intense burst of radiation; extraneous illumination on film caused by internal reflection in the camera; a gradual widening in shape, esp. towards the hem of a garment; trousers whose legs get progressively wider from the knees down; an upward and outward curve of a ship's bows, designed to throw the water outwards when in motion; (v) (up) burn or shine with a sudden intensity; (of a situation or emotion) suddenly become intense or violent; (up) suddenly become angry; gradually become wider at one end; (of a person's nostrils) dilate; (of a person) cause (the nostrils) to dilate

		Judder: (Brit) (n,v) (especially of something mechanical) shake and vibrate rapidly and with force

		Unguent: a soft greasy or viscous substance used as ointment or for lubrication

		Sealant: material used for sealing something so as to make it airtight or watertight

		Tarmac: (n) material used for surfacing roads or other areas, consisting of broken stone mixed with tar; a runway or other area surfaced with tarmac or a similar material; (v) surface (a road or other outdoor area) with tarmac or a similar material

		Hunker: squat or crouch down low; bend the top of one's body forward. Hunch; apply oneself seriously to a task

		Sluice: (n) a sliding gate or other device for controlling the flow of water, especially one in a lock gate; an artificial water channel for carrying off overflow or surplus water; (in gold mining) a channel or trough constructed with grooves into which a current of water is directed in order to separate gold from the ore containing it; an act of rinsing or showering with water; (v) wash or rinse freely with a stream or shower of water; (of water) pour or flow freely

		Subsidence: the gradual caving in or sinking of an area of land

		Serge: a durable twilled woolen or worsted fabric

		Alleycat: a cat that lives wild in a town

		Teetotal: choosing or characterized by abstinence from alcohol; abstemious, dry, sober

		Plenipotentiary: (n) a person, esp. a diplomat, invested with the full power of independent action on behalf of their government, typically in a foreign country; (a) having full power to take independent action; (of power) absolute

		Upstage: (v) divert attention from (someone) towards oneself; (of an actor) move towards the back of a stage to make (another actor) face away from the audience; (n) at or towards the back of a theatre stage

		Wile: lure. Entice; another way of saying "while something away"

		Syllogism: an instance of a form of reasoning in which a conclusion is drawn from two given or assumed propositions (premises.)  common or middle term is present in the two premises but not in the conclusion (eg: all dogs are animals, all animals have four legs, therefore all dogs have four legs); deductive reasoning as distinct from induction

		Pandemic: (a,n) (of a disease) prevalent over a whole country or world

		Gloat: dwell on one's own success or another's misfortune with smugness or malignant pleasure; relish, take great pleasure in, crow over, preen oneself about

		Chide: scold or rebuke; chastise, upbraid, berate, castigate, lambaste, reprimand, reproach, reprove, admonish, remonstrate with, reprehend, objurgate

		Serene: (a) calm, peaceful, and untroubled; tranquil, poised, placid, unruffled; (n) an expanse of clear sky or calm sea

		Sashay: (n) (in American square dancing) a figure in which partners circle each other by taking sideways steps

		Carom: (n) a cannon in billiards or pool; (v) make a carom. Strike and rebound

		Vindicate: clear (someone) of blame or suspicion; acquit, exonerate, absolve, exculpate, redeem; show or prove to be right, reasonable, or justified; warrant, substantiate, confirm, corroborate, back, evidence, extenuate

		Miscreant: (n,a) a person who has done something wrong or unlawful; a heretic

		Hurtle: move or cause to move at high speed, typically in an uncontrolled manner; rush, chase, bolt, dash, career, careen, hare, scud, stampede, gallop, streak, shoot

		Fetch: (v) go for and then bring back (someone or something) for someone; collect, bring, usher in, ferry; bring forth (blood or tears); take a (breath). Heave a (sigh); achieve (a particular price) when sold; (n) the distance travelled by wind or waves across open water; the distance a vessel must sail to reach open water; a stratagem or trick; the apparition or double of a living person, formerly believed to be a warning of that person's impending death

		Telescope: (as v) (with reference to an object made of concentric tubular parts) slide or cause to slide into itself, so it becomes smaller; crush (a vehicle) by the force of an impact; condense or conflate so as to occupy less space or time

		Curry: (as v) prepare or flavor with a sauce of hot-tasting spices; groom (a horse) with a curry comb; treat (tanned leather) to improve its properties; thrash, beat.

		Superannuated: (a) (of a post or employee) belonging to a superannuation scheme; outdated or obsolete through age or new developments; anachronistic, moribund, defunct, antiquated, disused; (v) retire (someone) with a pension

		Superannuation: regular payment made into a fund by an employee towards a future pension; the pension paid to a retired employee who has contributed to a superannuation fund; the process of superannuating an employee

		Flummox: (informal) perplex (someone) greatly; bewilder, bemuse, puzzle, baffle, nonplus, disconcert, obfuscate, faze, discombobulate

		Frazzle: (informal) (v) completely exhausted; cause to shrivel up with burning; (n) the state of being completely exhausted; the state of beings completely burnt

		Pustule: a small blister or pimple on the skin containing pus; carbuncle, wen, cyst, abscess, papule; a small raised spot or rounded swelling, esp. one in a plant resulting from fungal infection

		Carbuncle: a severe abscess or multiple boil in the skin, typically infected with staphylococcus bacteria; boil, pustule, wart, wen, canker, whitlow, furuncle; a bright red gem, in particular a garner cut en cabochon

		En cabochon: (of a gem) polished but not faceted

		Garnet: a precious stone consisting of a deep red vitreous silicate material

		Boil: (v) simmer, seethe; execute (someone) by subjecting them to the heat of boiling liquid; (of the sea or clouds) be turbulent and stormy; froth, foam, seethe, roil (of a person or strong emotion) be stirred up; fine, smolder, fulminate; (n) (Brit) (as "go off the boil") be in a state of great activity or excitement; a sudden rise of a fish at a fly; an inflamed pus-filled swelling on the skin, caused typically by the infection of a hair follicle

		Smolder: (v) burn slowly with smoke but no flame; show or feel barely suppressed anger, hatred, or another powerful emotion; exist in a suppressed or concealed state; (n) smoke coming from a smoldering fire

		Wen: a boil or other swelling or growth on the skin, especially a sebaceous cyst; a very large or overcrowded city

		Whitlow: an abscess in the soft tissue near a fingernail or toenail

		Canker: (n) a destructive fungal disease of apple and other trees that result in damage to the bark; an open lesion in plant tissue caused by infection or injury; an ulcerous condition or disease of a human or animal; (canker sore) a small ulcer of the mouth or lips; ulceration of the throat and other orifices of birds, typically caused by a protozoal infection; a malign and corrupting influence that is difficult to eradicate; blight, scourge, poison, cancer, pestilence; (v) (of woody plant tissue) become infected with canker; infected with a pervasive and corrupting illness

		Pestilence: a fatal epidemic disease, especially bubonic plague

		Spurious: not being what it purports to be. False or fake; specious, bogus, facticious, counterfeit, fraudulent, trumped-up, sham, contrived, feigned, fictitious, meretricious, adulterine, ersatz

		Adulterine: (of a child) born as the result of an an adulterous relationship; illegal, unlicensed, or spurious

		Ersatz: (of a product) made or used as a substitute, typically an inferior one, for something else; facsimile, replica, faux, synthetic, shoddy; not real or genuine

		Inimical: tending to obstruct or harm; harmful, injurious, detrimental, deleterious, pernicious, ruinous, dalamitous, antagonistic, antipathetic, hostile, prejudicial, malefic; unfriendly, hostile

		Deleterious: causing harm or damage

		Pernicious: having a harmful effect, especially in a gradual or subtle way; inimical, baleful, noxious, cancerous, malignant, pestilent, pestiferous

		Cohort: an ancient Roman military unit, comprising six centuries, equal to one tenth of a legion; a group of people with a shared characteristic; a group of people with a common statistical characteristic; (derogatory) a supporter or companion

		Recant: say that one no longer holds an opinion or belief, especially one considered heretical; forsake, renounce, disavow, abjure, renege on, apostasize, tergiversate

		Fanatic: (n,a) filled with excessive and single minded zeal; chauvinist, partisan, devoted, zealot, apologist, diehard, activist, radical

		Invigilate: (Brit) supervise candidates during an examination

		Grit: (n) small loose particles of stone or sand; (with numeral) indicating the grade of fineness of an abrasive; a coarse sandstone; courage and resolve. Strength of character; mettle, fortitude, pluck, valor, tenacity, perseverance, endurance, stamina; (v) spread grit and often salt on (an icy road); grate

		Twang: (n) a strong ringing sound such as that made by the plucked string of a musical instrument or a released bowstring; a nasal or other distinctive manner of pronunciation or intonation characteristic of the speech of an individual, area, or country. an accent; (v) make or cause to make a twang; utter (something) wit a nasal twang

		Brackish: (of water) slightly salty, as in river estuaries; (of fish or other organisms) living in or requiring brackish water

		Wield: hold and use (a weapon or tool); brandish, flourish, twirl, display, flaunt, ply; have and be able to use (power or influence)

		Flourish: (v) thrive, prosper, burgeon, proliferate, mushroom, bloom; wave (something) about to attract attention; (n) a bold or extravagant gesture or action, made especially to attract attention; an elaborate rhetorical or literary expression; an ornamental flowing curve in handwriting or scrollwork; an impressive and successful act or period; a fanfare played by brass instruments; an ornate musical passage; an extenporozed addition played especially at the beginning or end of a composition

		Aloft: up in or into the air. Overhead; up the mast or into the rigging of a ship

		Brandish: wave or flourish (something, especially a weapon) as a threat or in anger or excitement

		Flaunt: display (something) ostentatiously, especially in order to provoke envy or admiration or to show defiance; dangle, wave, brandish, parade, show off, make a great show off, vaunt; dress or behave in a sexually provocative way

		Weld: (v) join together (metal parts) by heating the surfaces to the point of melting with a blowpipe, electric arc, or other means, and uniting them by pressing, hammering, etc.; fuse, unite, bind, seal, amalgamate, splice, knit, meld, melt, blend, solder; forge (an article) by welding; (together) cause to combine and form a harmonious or effective whole; (n) a welded joint; a widely distributed plant related to mignonette, yielding a yellow dye; the yellow dye made from weld, which has been used since Neolithic times and was a popular color for Roman wedding garments

		Splice: (v) join or connect (a rope or ropes) by interweaving the strands at the end; braid, entwine, interweave, interlace, intertwine, knit, lace; join (pieces of timber, film, or tape) at the ends; join or insert (a gene or gene fragment); (n) a join consisting of two ropes, pieces of tape or timber, etc. Joined together at the ends; the wedge shaped tang of a cricket-bad handle, forming a joint with the blade

		Strew (strewed, strewn): scatter or spread (things) untidily over a surface or area; litter, toss, sow, bestrew, besprinkle; cover (a surface or area) with untidily scattered things; be scattered or spread untidily over (a surface or area)

		Staid: sedate, respectable, and unadventurous; prim, stiff, demure, prissy, unenterprising

		Frisk: (v,n) (of a police officer or other official) pass the hands over (someone) in a search for hidden weapons, drugs, or other items; skip or leap playfully. Frolic

		Curvet: (v,n) (of a horse) perform a series of jumps on the hind legs; leap gracefully or energetically

		Zoot suit: a man's suit with baggy, tight cuffed, sometimes high waisted trousers and an oversized jacked with exaggeratedly broad, padded shoulders and wide lapels (first popularized in the 1940s)

		Heft: (v) lift or carry (something heavy); heave, hoist, haul, upheave, raise; lift or hold (something) in order to test its weight; (n) the weight of someone or something; ability or influence

		Alack: (exclamation) used to express regret or dismay

		Fend: look after and provide for oneself, without any help from others; hold one's own, cope alone, get by unaided; paddle one's own canoe

		Shun: persistently avoid, ignore, or reject (someone or something) through antipathy or caution; eschew, evade, keep away from, give a wide berth to, spurn, cold-shoulder, snub, steer clear of

		Snub: (v) rebuff, ignore, or spurn disdainfully; slight, scorn, disdain, brush off; check the movement of (a horse or boat), especially by a rope wound round a post; (n) an act of rebuffing or ignoring someone or something; (a) (snub-nosed) (of a person's nose) short and turned up at the end

		Slight: (a) small in degree. Inconsiderable; negligible, remote, scant, exiguous; (especially of a creative work) not profound or substantial. Rather trivial or superficial; petty, paltry, shallow; (of a person or their build) not sturdy. Thin or slender; dainty, delicate, puny, frail, gracile, attenuate; (v) insult (someone) by treating or speaking of them without proper respect or attention; snub, spurn, disregard, neglect, disdain, misprize; raze or destroy (a fortification); (n) an insult caused by a failure to show someone proper respect or attention

		Spurn: reject with disdain or contempt; scorn, rebuff, repudiate, snub, slight, jilt, dismiss; (archaic) strike, tread, or push away with the foot

		Jilt: (v) suddenly reject or abandon (a lover); desert, forsake, betray, leave in the lurch; (n, archaic) a person, esp. a woman, who capriciously rejects a lover

		Gainsay: deny or contradict (a fact or statement); debunk, disprove, challenge, confute, controvert, disaffirm; speak against or oppose (someone)

		Controvert: deny the truth of (something); argue about (something)

		Confute: prove (a person or an assertion or accusation) to be wrong

		Razz: (informal) tease (someone) playfully

		Ensconce: establish or settle (someone) in a comfortable, safe place; entrench, lodge, nestle, establish

		Batch: (n) a quantity or consignment of goods produced at one time; (v) arrange (things) in sets or groups

		Consignment: a batch of goods destined for or delivered to someone; the action of consigning or delivering something

		Consign: deliver (something) to a person's keeping; assign, entrust, remit, grant, bequeath, commend; send (goods) by a public carrier; put someone or something in (a place) in order to be rid of it or them

		Gaff: (n) a stick with a hook or barbed spear, for landing large fish; a spar to which the head of a fore-and-aft sail is bent; (v) seize or impale with a gaff

		Spar: (n) a thick, string pole such as is used for a mast or yard on a ship; the main longitudinal beam of an aeroplane wing; a cristalline, easily cleavable, translucent or transparent mineral; (v,n) make the motions of boxing without landing heavy blows, as a form of training; argue with someone without marked hostility; quarrel, squabble, row, bicker, wrangle; (of a gamecock) fight with the feet or spurs

		Constable: (Brit) a police officer, esp. of the lowest rank; the governor of a royal castle; the highest ranking official in a royal household

		Ruffian: a violent person, esp. one involved in crime; thug, scoundrel, rogue, rascal, hoodlum, delinquent, myrmidon, villain, miscreant

		Myrmidon: a follower or subordinate of a powerful person, typically one who is unscrupulous or carried out orders unquestioningly (ety: a warlike Thessalian people who accompanied Achilles to Troy)

		Rogue: (n) a dishonest or unprincipled man; reprobate, rascal, wretch, blackguard, miscreant, knave, dastard, varlet, wastrel; a person whose behavior one disapproves of but who is nonetheless likeable or attractive; scamp, rascal, imp, rapscallion; an elephant or other large wild animal living apart from the herd and having savage or destructive tendencies; a person or thing that behaves in an aberrant or unpredictable way, typically with damaging or dangerous effects; a seedling or plant deviating from the standard variety; (v) remove inferior or defective plants or seedlings from (a crop)

		Rascal: a mischievous or cheeky person, esp. a child or a man (typically used in an affectionate way)

		Thrash: (v) beat (a person or animal) repeatedly and violently with a stick or a whip; flog, whip, scourge, flagellate, flail,  lather, cane; move in a violent and convulsive way; (around, about) flail, flounder, jerk, toss, squirm, writhe, wriggle, wiggle, twitch; struggle in a desperate or unfocused way to do something; (n) a violent or noisy movement of beating or thrashing; a short, fast, loud piece or passage of rock music

		Squirm: wriggle or twist the body from side to side, especially as a result of nervousness or discomfort; wriggle, writhe, slither, thresh, flounder, agonize; shown or fell embarrassment or shame; (n) a wriggling movement

		Squander: waste (something,  esp. money or time) in a reckless or foolish manner; allow (an opportunity) to pass or be lost

		Undergrowth: (Brit) a dense growth of shrubs and other plants, esp. under trees in woodland; shrubbery, underwood, brushwood, brush, underscrub, scrub, thicket, coppice, copse, herbage, verdure

		Verdure: lush green vegetation; the fresh green color of lush vegetation; a condition of freshness

		Coppice: (n) an area of woodland in which trees or shrubs are periodically cut back to ground level to simulate growth and provide firewood or timber; (v) cut back (a tree or shrub) to ground level periodically to stimulate growth

		Copse: a small group of trees; grove, boscage

		Brushwood: undergrowth, twigs, and small branches

		Atremble: trembling

		Fettle: (n) condition, shape; (v) trim or clean the rough edges of (a metal casting or a piece of pottery) before firing; make or repair (something)

		Plinth: a heavy bass supporting a statue or vase; the lower square slab at the base of a column; the base course of a building, or projecting base of a wall

		Mosey: (informal) (v,n) walk or move in a leisurely manner

		Timorous: showing or suffering from nervousness or a lack of confidence; diffident, apprehensive, bashful, timid, demure, coy, trepidatious

		Reticent: not revealing one's thoughts or  feelings readily; inhibited, taciturn, tight-lipped, introverted, restrained, modest

		Laodicean: (a,n) half-hearted or indifferent, especially with respect to religion or politics (ety: denoting the early christians of Asia Minor)

		Snare: (n) a trap for catching birds or mammals, typically one having a noose of wire or cord; a thing likely to lure or tempt someone into harm or error; pitfall, tangle, web, mesh, hazard, peril, toils; a length of wire, gut, or hide stretched across a drumhead to produce a rattling sound; a wire loop for severing polyps and other growths; (v) catch (a bird or mammal) in a snare; catch or trap (someone)

		Toils: used in reference to a situation regarded as a trap

		Hurl: throw or impel (someone or something) with great force; utter (abuse) vehemently

		Contend: (with) struggle to surmount (a difficulty); (for) compete with others in a struggle to achieve (something); assert something as a position in an argument; claim, argue, allege, declare, insist

		Louche: disreputable or sordid in a rakish or appealing way

		Rakish: having or displaying a dashing, jaunty, or slightly disreputable quality or appearance; dashing, debonair, devil-may-care, louche, spruce, jaunty, dapper; (esp. of a boat or car) smart and fast-looking, with streamlined angles and curves

		Coterie: a small group of people with shared interests or tastes, especially one that is exclusive of other people; clique, inner circle, pack, crew, band, clan, fellowship, cabal, junta

		Cabal: a secret political clique or faction; a secret intrigue

		Junta: a military or political group that rules a country after taking power by force; a deliberative or administrative council in Spain or Portugal

		Quixotic: extremely idealistic. Unrealistic and impractical; romantic, starry-eyed, utopian

		Gorge: (n) a narrow valley between hills or mountains, typically with steep rocky walls and a stream running through it; the throat; the crop of a hawk; the contents of the stomach; a narrow rear entrance to a bastion, outwork, or other fortification; a mass of ice obstructing a narrow passage, especially a river; (v) (oneself) eat a large amount greedily; fill oneself with food

		Syncretism: the amalgamation or attempted amalgamation of different religions, cultures, or schools of thought; the merging of different inflectional varieties of a word during the development of a language

		Ghoul: an evil spirit or phantom, especially one supposed to rob graves and feed on dead bodies; a person morbidly interested in death or disaster

		Mangy: having mange; in poor condition. Shabby; unkempt, shoddy, squalid, filthy, seedy

		Mange: a skin disease of mammals caused by parasitic mites and accasionally communicable to humans. It is characterized by severe itching, hair loss, and the formation of scabs and lesions

		Tremulous: shaking or quivering slightly; quavering, quaking, wavering, trembling, atremble; timid. Nervous; diffident, shy, timorous, frightened

		Forbear: politely or patiently restrain an impulse to do something. Refrain; withhold, shun, eschew, desist; refrain from doing or using (something) (eg: Rebecca could not forbear a smile

		Mariner: a sailor; seafaring man, seaman

		Exacting: making great demands on one's skill, attention, or other resources; demanding, grueling, exigent, Herculean, taxing, onerous, arduous, laborious, testing

		Grueling: extremely tiring and demanding; debilitating, wearying, unsparing, severe, strenuous, laborious, exigent

		Limn: depict or describe in painting or words; suffuse or highlight (something) with a bright color or light

		Portentous: of or like a portent. Of momentous significance; ominous, foreshadowing, premonitory, foreboding, fateful, gloomy, sinister; done in a pompously or overly solemn manner so as to impress; bombastic, pontifical, sonorous, grandiloquent, declamatory, overripe

		Portent: a sign or warning that a momentous or calamitous event is likely to happen; omen, presage, harbinger, augury, foretoken, auspice, forecast, presentiment; future significance; an exceptional or wonderful person or thing

		Auspice: a divine or prophetic token

		Momentous: of great importance or significance, especially in having a bearing on future events; crucial, critical,  epoch-making, historic, fateful, portentous, pivotal, consequential, grave, decisive

		Foretoken: be a sign of (a future event); foreshadow

		Augury: a sign of what will happen in the future. An omen; the interpretation of omens

		Garter: a band worn around the leg to keep a stocking or sock up; a band worn on the arm to keep a shirtsleeve up

		Bough: a main branch of a tree; arm, offshoot, limb, spur

		Engross: absorb all the intention or interest of; gain or keep exclusive possession of; produce (a legal document, esp. a deed or statute) in its final form

		Comatose: relating to or in a state of coma; soporose, insensate, insentient; (humorous) extremely lethargic or sleepy; sluggish, torpid, languid, idle, indolent, shiftless, slothful, stagnant, somnolent, supine, dormant

		Torpid: mentally or physically inactive. Lethargic; (of an animal) dormant, especially during hibernation

		Keen: (a) (Brit) having it showing eargerness or enthusiasm; interested in or attracted by (someone or something) sharp or penetrating, in particular: (of a sense) highly developed; sharp, acute, sensitive; (of mental faculties) quick to understand; shrewd, perspicacious, rapier-like, sagacious, insightful, canny, bright, brilliant, astute, incisive; (of the edge or point of a blade) sharp; (of the air or wind) extremely cold. Biting; (of a smell, light, or sound) penetrating. Clear; (Brit) (of activity or feeling) intense; fierce, passionate, consuming, fervid, fervent, ardent; (of prices) very low. Competitive; (v) wail in grief for a dead person; lament, mourn, grieve, sorrow, ululate, greet; make an eerie wailing sound; (n) an Irish funeral song accompanied by wailing in lamentation for the dead

		Largesse: generosity in bestowing money or gifts upon others; munificent, magnanimity, charity, philanthropy, altruism; money or gifts given generously; patronage, sponsorship, backing

		Wraith: a ghost or ghostlike image of someone, especially one seen shortly before or after their death; used in reference to a pale, thin, or insubstantial person or thing; a wisp or faint trace of something (eg: a sea breeze was sending a grey wraith of smoke up the slopes

		Expedient: (a,n) (of an action) convenient and practical although possibly improper or immoral; (of an action) suitable or appropriate

		Thrall: (as "in thrall to") the state of being in someone's power, or of having great power over someone; a slave, servant, or captive

		Enthral: capture the fascinated attention of; ensnare, bewitch, beguile, enrapture, enchant, charm, entrance, allure, lure, dazzle, engross, rivet, transfix, spellbind, hypnotize, mesmerize, absorb; (archaic) enslave

		Rivet: (n) a short metal pin or bolt for holding together two plates of metal, it's headless end being beaten out or pressed down when in place; a river-like device for holding seams of clothing together; (v) join or fasten (plates of metal) with a rivet; fix (someone or something) so as to make them incapable of movement; attract and completely engross (someone); direct (one's eyes or attention) intently

		Purlieu: the area near or surrounding a place; a person's usual haunts; (Brit) a tract on the border of a forest, esp. one earlier includdd in it and still partly subject to forest laws

		Haunt: (of a ghost) manifest itself at (a place) regularly; (of a person or animal) frequent (a place); be persistently and disturbingly present in (the mind); torment, bedevil, obsess, oppress, disturb, trouble, plague, burden, beset, beleaguer; (of something unpleasant) continue to affect or cause problems for; (n) a place frequented by a specified person; purlieu, den, hang-out, stamping-ground, retreat, domain

		Harry: persistently carry out attacks on (an enemy or an enemy's territory); assail, assault, maraud, ravage, devastate, plunder, ransack, raid, pillage, despoil, depredate, reave; persistently harass

		Despoil: steak or violently remove valuable possessions from. Plunder; loot, rifle, pillage, vandalize, depredate, ravish, maraud

		Ravish: seize and carry off (someone) by force; (of a man) rape (a woman); defile, molest, violate; fill (someone) with intense delight. Enrapture; delight, entrance, transport, fascinate

		Maraud: go about in search of things to steal or people to attack; foray, harry, reave; raid and plunder (a place)

		Reave (reft, reft): (archaic) carry out raids in order to plunder; rob (a person or place) of something by force; steal (something)

		Plunder: (v,n) steal goods from (a place or person) typically using force and in a time of war or civil disorder; steal (goods) using force and in a time of disorder; take material from (artistic or academic work) for one's own purposes

		Beleaguer: (usually: beleaguered) lay siege to; put in a very difficult situation

		Penury: the state of being very poor. Extreme poverty; pauperism, destitution, hardship,  privation, beggary, insolvency

		Hag-ridden: affected by nightmares or anxieties

		Lair: a place where a wild animal lives; den, burrow, haunt, hollow, dugout; a secret or private place in which a person seeks concealment or seclusion; cache, hideaway, hideout, refuge

		Rump: the hind part of the body of a mammal or the lower back of a bird; (humorous) a person's buttocks; haunches, backside, hindquarters, derrière, bottom, seat; a small or unimportant remnant of something originally larger; remainder, rest, remains

		Protract: prolong

		Risible: provoking laughter through being ludicrous; absurd, droll, grotesque, zany, derisible

		Aporia: an irresolvable internal contradiction or logical disjunction in a text, argument, or theory (eg: the celebrated aporia whereby a Cretan declares all Cretans to be liars); the expression of doubt

		Circumscribe: restrict (something) within limits; (about) confine, restrict, curb, restrain; draw (a figure) round another, touching it at points but not cutting it

		Aphasia: inability (or impaired ability) to understand or produce speech, as a result of brain damage

		Crass: showing no intelligence or sensitivity; asinine, bovine, coarse, boorish,  oafish, witless, vacuous, thick, dense

		Bituminous: containing or of the nature of bitumen

		Bitumen: a black viscous mixture of hydrocarbons obtained naturally or as a residue form petroleum distillation. It is used for road surfacing and roofing

		Iconostasis: a screen bearing icons, separating the sanctuary of many eastern churches from the nave

		Canon: a general law, rule, principle, or criterion by which something is judged;  convention, norm, precept, tenet; a church decree or law; a collection or list of sacred books accepted as genuine; the works of a particular author or artist that are recognized as genuine; the list of works considered to be permanently established as being of the highest quality; (in the Roman Catholic Church) the part of the mass containing the words of consecration; a piece in which the same melody is begun in different parts successively, so that the imitations overlap; (as "canon regular") (in the Roman Catholic Church) a member of certain orders of clergy that live communally according to an ecclesiastical rule in the same way as monks; a member of clergy who is on the staff of a cathedral, especially one who is a member of the chapter

		Blot: (n) a dark mark or stain made by ink, paint, dirt, etc.; spot, dot, speck, fleck, blotch, smudge, patch, dab, smut, smear, streak; a shameful act or quality that damages an otherwise good character or reputation; blemish, stigma, brand, defect, flaw, fault, blight; a thing that mars the appearance of something; carbuncle, eyesore, atrocity; (v) dry (a wet surface or substance) using an absorbent material; mark or stain (something); damage the good character or reputation of; taint, tarnish, mar, smear, besmirch, calumniate, sully; (out) cover writing or pictures with ink or paint so they cannot be seen; (out) obscure a view; (out) obliterate or disregard something painful in one's memory or existence

		Expunge: obliterate or remove completely (something unwanted or unpleasant); wipe out, efface, extirpate, annihilate

		Obliterate: destroy utterly. Wipe out; make invisible of indistinct. Conceal or cover; cancel (something, especially a postage stamp) to prevent further use; expunge, cross out (ety: Latin ob + "littera" meaning "letter, something written")

		Recumbent: (a) (especially of a person or effigy) lying down; prostrate, supine, prone, procumbent; spreadeagled, reclining; (of a plant) growing close to the ground; (n) a type of bycicle designed to be ridden lying almost flat on one's back

		Downy: covered with fine, soft hair or feathers; soft and fluffy; velvety, fuzzy, wooly, silky, feathery, fleecy, furry, smooth; filled with soft feathers; (of a person) shrewd. Sharp

		Impinge: (on) have an effect, esp. a negative one; (on) advance over an area belonging to someone or something else. Encroach; infringe, invade, trespass; strike

		Stupendous: extremely impressive; extraordinary, remarkable, prodigious, phenomenal, wondrous; colossal, gigantic, monumental, elephantine, gargantuan, prodigious, titanic, Herculean, brobdingnagian

		Prodigious: remarkably or impressively great in extent, size, or degree; unnatural or abnormal

		Gout: a disease in which defective metabolism of uric acid causes arthritis. A drop or spot of something

		Lunkhead: (informal) a slow-witted person

		Moat: (v,n) a deep, wide ditch surrounding a castle, fort, or town, typically filled with water and intended as a defense against attack

		Ogival: a pointed or Gothic arch; one of the diagonal groins or ribs of a vault

		Aquiline: like an eagle; (of a person's nose) hooked or curved like an eagle's beak

		Tipple: drink alcohol, especially habitually

		Disquisition: a long or elaborate essay or discussion on a particular subject

		Dalliance: a casual romantic or sexual relationship; a period or brief or casual involvement with something; a period of brief or casual involvement with something

		Debutante: un upper class young woman making her first appearance in fashionable society; a woman making her first public appearance, esp. in sport

		Porlock: the "person from porlock" was an unwelcome visitor to Samuel Taylor Coleridge during his composition of the poem Kubla Khan in 1797. Refers to unwanted intruders who disrupt inspired creativity

		Flit: move swiftly and lightly; dart, skip, dash, caper, prance, frisk, sprig, scamper, cavort, gambol

		Appendage: a thing that is added or attached to something larger or more important: a projecting part of an invertebrate or other living organism, with a distinct appearance or function

		Undaunted: not intimidated or discouraged by difficulty, danger, or disappointment; unflinching, undismayed, unabashed, unfaltering, dauntless, intrepid, bold, valiant, mettlesome, indomitable, resolute, daring, daredevil

		Denizen: a person, animal, or plant that lives or is found in a particular place; a foreigner allowed certain rights in their adopted country

		Oppidan: (n) (at Eton college) a pupil who boards in town rather than in the school itself; (a) relating to a town. Urban

		Buffet: (sense 2) (v) (especially of wind or waves) strike repeatedly and violently. Batter; knock (someone) off course; (of difficulties) afflict (someone) over a long period; (n) a blow or punch; a shock or misfortune

		Wicker: pliable twigs, typically of willie, plaited or woven to make items such as furniture and baskets

		Spigot: a tap; a device for controlling the flow of liquid in a tap; a small plug or peg, esp. for insertion into the vent of a cask; the plain end of a section of a pipe fitting into the socket of the next one

		Encroach: intrude on (a person's territory, rights, personal life, etc.); advance gradually beyond usual or acceptable limits

		Doff: remove (an item of clothing); take off or raise (one's hat) as a greeting or token of respect

		Haunch: the buttock and thigh considered together, in a human or animal; the leg and loin of an animal, esp. a deer, as food; the side of an arch, between the crown and the pier

		Pier: a platform on pillars projecting from the shore into the sea, typically incorporating entertainment arcades and places to eat; a structure projectingfrom the shore into a body of water, used as a la ding stage for boats; wharf, dock, waterfront, marina, sea wall; a breakwater or mole; (Brit) a long, narrow structure projecting from an airport terminal, giving passengers access to an aircraft; a solid support designed to sustain vertical pressure, in particular: the pillar of an arch or supporting a bridge; plinth, pedestal, buttress, stanchion, upright; a walk between windows or other adjacent openings

		Spoonerism: a verbal error in which a speaker accidentally transposes the initial sounds or letters of two or more words, often to humorous effect, as in the sentence "you have hissed the mystery lectures" (ety: after rev. W. A. Spooner (1844-1930), an English scholar who reputedly made such errors in speaking)

		Nether: lower in position; under, lower, bottom (eg: nether lip); lying or believed to lie beneath the earth's surface

		Evocation: the act of bringing or recalling a feeling, memory, or image to the conscious mind; an account or work of art that brings or recalls a feeling...; the action of eliciting a response; the action of invoking a deity

		Cot: a small bed with high batted sides for a baby or a very young child; a plain narrow bed; a camp bed; a bed resembling a hammock hung from deck beams, formerly used by officers on a boat or ship; a small shelter for livestock; a small, simple cottage

		Antiphonal: (of music, especially church music, or a section of a church liturgy) sung, recited, or played alternately by two groups

		Blush: (n,v) show shyness, embarrassment, or shame by becoming red in the face; crimson, flush, mantle, redden; be or become pink or pale red; (n) a wine with a slight pink tint made in the manner of white wine but from red grape varieties

		Duck: (as v) lower the head of the body quickly to avoid a blow or missile or so as not to be seen; depart quickly; push or plunge (someone) under water, either playfully or as punishment; refrain from playing a winning card on a particular trick for tactical reasons

		Sheen: (n) a soft lustre on a surface; patina, burnish, polish, radiance, gloss, shine, gleam; (v) shine or cause to shine softly

		Dunce: a person who is slow at learning. A stupid person; fool, cretin, simpleton, ignoramus, dullard, oaf, halfwit, dolt

		Ignoramus: an ignorant or stupid person

		Oaf: a man who is rough or clumsy and unintelligent; lout, boor, Neanderthal, churl, gawk, yokel, fool, dolt, dullard, bosthoon

		Dolt: a stupid person

		Dullard: a slow or stupid person

		Nincompoop: a foolish or stupid person

		Howl: (v,n) a long, doleful cry uttered by an animal such as a dog or a wolf; bay, yowl, bark, yelp; a loud cry of pain, fear, anger, or amusement; wail, bawl, bellow, shriek, caterwaul, ululate; a prolonged wailing noise such as that made by a strong wind; a sailing noise in a loudspeaker due to feedback

		Bungle: carry out (a task) clumsily or incompetently; mismanage, botch, mar, ruin; (bungling) make or be prone to making many mistakes; amateurish, inept, inexpert, maladroit, gauche, oafish, bumbling, muddled

		Ridge: (n) a long, narrow hilltop, mountain range, or watershed; the line or edge formed where the two sloping sides of a roof meet at the top; a narrow raised band on a surface; a raised strip of arable land, esp. (in medieval fields) one of a set separated by furrows; an elongated region of high barometric pressure; (v) mark with or form into ridges; (of a surface) form into or rise up as a ridge

		Douse: pour a liquid over. Drench; soak, souse, saturate, flood, inundate, deluge, slosh; extinguish (a fire or light); quench, smother, dout, put out; lower (a sail) quickly

		Founder: (of a ship) fill with water and sink; capsize, submerge, run aground;(of a plan or undertaking) fail or break down as a result of a particular problem; miscarry, go awry, go astray; (of a horse or its rider) stumble or fall from exhaustion, lameness, etc.; stagger, lurch, totter, tumble, topple, collapse

		Aitche: the letter 'h'

		Aerobic: relating to, involving, or requiring free oxygen; relating to or denoting exercise taken to improve the efficiency of the body's cardiovascular system in absorbing and transporting oxygen

		Trounce: defeat easily in a contest; crush, overwhelm, beat hollow; rebuke or punish severely; thrash, whip, flog, cane, birch, chastise, lambaste

		Rankle: (of a comment or fact) cause continuing annoyance or resentment; annoy or irritate (someone); nettle, gall, vex, irk, provoke, exasperate, affront, upset; (of a wound or sore) continue to be painful; fester

		Reconvene: convene or cause to convene again, especially after a pause in proceedings

		Convene: come or bring together for a meeting or activity; assemble, foregather, congregate, muster, collect, gather

		Yoke: (n) a wooden crosspiece that is fastened over the necks of two animals and attached to the plough or cart they are to pull; harness, collar; used to refer to something regarded as oppressive or restrictive; tyranny, hegemony, subjugation, serfdom, thrall; (in Ancient Rome) an arch of three spears representing a yoke, under which a defeated army was made to walk; a pair of animals yoked together; a part of a garment that fits over the shoulders and to which the main part of the garment is attached; (v) put a yoke on (a pair of animal); couple or attach with a yoke; tether, hitch, fasten, harness; cause (two people or things) to be joined in a close relationship

		Muck: (n) dirt, rubbish, or waste matter; farmyard manure, widely used as fertilizer; something regarded as distasteful, unpleasant, or of poor quality; (v) (Brit) remove manure and other dirt from a horse's stable or other animal's dwelling

		Discountenance: refuse to approve of; disturb the composure of; discomfit, disconcert, unsettle, nonplus, perturb, perplex, bewilder, baffle, fluster, ruffle, upset, agitate, dismay, discompose, put someone off their stroke/stride; embarrass, abash, discombobulate

		Peter: (out) decrease or fade gradually before coming to an end

		Shuck: (n) an outer covering such as a husk or pod, especially the husk of an ear of maize; the shell of an oyster or clam; the integument of certain insect pupae or larvae; (v) remove the shucks from maize or shellfish; (off) (informal) take off (a garment); (off) (informal) get rid of. Abandon; (informal) cause (someone) to believe something that is not true. Fool or tease

		Integument: a tough outer protective layer, especially that of an animal or plant

		Husk: (n) the dry outer covering of some fruits and seeds; shell, hull, pod, casing, Integument, rind, skin, shuck, pericarp, legume; a dry or rough outer layer; huskiness; bronchitis is cattle, sheep, or pigs caused by parasitic infestation, typically marked by a husky cough; (v) remove the husk or husks from; say something in a husky voice

		Husky: (of a voice or utterance) sounding low pitched and slightly hoarse; throaty, gruff, gravelly, coarse, croaky, raspy, guttural, thick; (of a person) big and strong; brawny, hefty, burly, thickset, robust, rugged, sturdy, Herculean, stark

		Pericarp: the part of a fruit formed from the wall of the ripened ovary

		Drudgery: hard menial or dull work; toil, donkey work, plodding

		Drudge: (n) a person made to do hard or dull work; menial, galley slave, houseboy, factotum, scullion, heart of wood and drawer of water, peon

		Galley slave: a person condemned to man the oars in a galley; a person who works very hard, typically performing menial or thankless tasks

		Lackey: (n) a servant, especially a liveried footman or manservant; valet, steward, footman, butler, vassal, page, drudge, factotum, equerry; a perso who is obsequiously willing to obey or serve another person; stooge, sycophant, minion, flatterer; a brownish European moth of woods and hedgerows, the caterpillars of which live communally in a silken tent on the food tree; (v) behave obsequiously towards. Wait as a lackey

		Sycophant: a person who acts obsequiously towards someone important in order to gain advantage (ety: Greek "sukophantes" meaning "informer")

		Equerry: an officer of the British royal household who attends or assists members of the royal family; an officer of the household of a prince or noble who had charge over the stables

		Factotem: an employee who does all kinds of work

		Peon: a Spanish-American day laborer or unskilled farm worker; a person who does menial work; a debtor held in servitude by a creditor, especially in the southern US and Mexico

		Scullion: a servant assigned the most menial kitchen tasks

		Dread: (v,a) anticipate with great apprehension or fear; regard with great awe and reverence; (n) great fear or apprehension; trepidation, angst, unease, disquiet, foreboding; a sudden take-off and flight of a flock of gulls or other birds

		Connive: secretly allow (something immoral, illegal, or harmful) to occur; conspire to do something immoral, illegal, or harmful; collaborate, collide, plot, scheme, machinate, cabal, complot

		Machinate: engage in plots; scheme

		Scald: (v) injure with very hot liquid or steam; heat (milk or other liquid) to near boiling point; immerse (something) briefly in boiling water for various purposes, such as to facilitate the removal of skin from fruit or to preserve meat; cause to feel a searing sensation like that of boiling water on skin; rinse (a container) with boiling water; (n) a burn or injury caused by hot liquid or steam; any of a number of plant diseases which produce an effect similar to scalding, esp. marked by browning and caused by excessive sunlight, bad storage condition, or atmospheric pollution

		Sissy: (n,a) a person regarded as effeminate or cowardly; coward, poltroon; feeble, spineless, effete, limp-wristed

		Ablution: (formal, humorous) an act of washing oneself; a ceremonial act of washing parts of the body or sacred containers; (Brit) (in army slang) a building or room containing washing facilities and toilets

		Plethora: a large or excessive amount of something; an excess of a bodily fluid, particularly blood

		Tam: a tam-o'-shanter (Scottish woolen cloth cap with a bobble at the center); a tall woolen hat worn by Rastafarians

		Spoil: (v) diminish or destroy the value or quality of; mar, impair, blemish, blight, deface, scar, wreck; prevent someone from enjoying (an occasion or event); sabotage, dash, scupper, torpedo, vitiate; mark (a ballot paper) incorrectly so as to make one's vote invalid, esp. as a gesture of protest; (of food) become unfit for eating; harm the character of (a child) by being too lenient or indulgent; pamper, overindulge, mollycoddle, cosset, coddle; treat with excessive kindness, consideration, or generosity; be extremely or aggressively eager for; rob (a person or a place) of goods or possessions by force or violence; (n) goods stolen or taken forcibly from a person or place; booty, loot, plunder, haul, pickings; waste material brought up during the course of an excavation or a dredging or mining operation

		Scupper: (n) a hole in a ship's side to carry water overboard from the deck; an outlet in the side of a building for draining water; (v) (Brit) sink (a ship or its crew) deliberately; scuttle, submerge; (informal) prevent from working or succeeding. Thwart

		Mollycoddle: (v) treat (someone) in an indulgent or overprotective way; (n) an effeminate or ineffectual man or boy

		Vitiate: spoil or impair the quality or efficiency of; destroy or impair the legal validity of

		Gallows (always plural): a structure, typically if two uprights and a crosspiece for the hanging of criminals; gibbet, scaffold; (as "the gallows") execution by hanging

		Gruel: a thin liquid food of oatmeal or other meal boiled in milk or water

		Nimrod: a skillful hunter; (informal) an inept person

		Pouch: (n) a small flexible bag, typically carried in a pocket or attached to a belt; a lockable bag for mail or dispatched; a pocket-like abdominal receptacle in which marsupials carry their young during lactation. Marsupium; any of a number of pocket-like animal structures, such as those in the cheeks of rodents) a baggy area of skin underneath a person's eyes; (v) put into a pouch; make (part of a garment) hang like a pouch

		Bray: (n,v) the loud harsh cry of a donkey or mule; a sound, voice, or laugh resembling a bray

		Batter: (v) strike repeatedly with blows; pummel, pound, buffet, belabor; subject (one's spouse, partner, or child) to repeated violence and assault; censure, criticize, or defeat severely or thoroughly; (of a wall) have a receding slope; (n) a gradual backwards slope in a wall or similar structure

		Balmy: characterized by pleasantly warm weather; temperate, tranquil, clement, benign, soothing, soft, mild, fragrant

		Splay: (v) thrust or spread (things, especially limbs or fingers) out and apart; (out) (especially of limbs or fingers) be thrust or spread out and apart; (out) become wider or more separated; construct (a window, doorway, or other aperture) so that it diverges or is wider at one side of the wall than the other; (n) a tapered widening of a road at an intersection to increase visibility; a surface making an oblique angle with another, especially a splayed window or other aperture; a degree of bevel or slant of a surface; (a) turned outward or widened (eg: girls sitting splay-legged)

		Anodyne: (a) not likely to cause offense or disagreement and somewhat dull. Bland; (n) a painkilling drug of medicine. A palliative

		Thoroughfare: a road or path forming a route between two places; a main road in a town

		Raucous: making of constituing a disturbingly harsh and loud voice; harsh, strident, grating, discordant, dissonant, jarring, shrill

		Emery: a greyish-black form of corundum in containing iron oxide or other impurities, used in powdered form as an abrasive; denoting materials coated with emery for polishing, smoothing, or grinding

		Corundum: extremely hard crystallized alumina, used as an abrasive. Ruby and sapphire are varieties of corundum

		Alumina: a white solid that is a major constituent of many rocks, especially clays, and is going crystallized as corundum, sapphire, and other minerals

		Whinny: (n) a gentle, high-pitched neigh; (v) (of a horse) make a whinny

		Gnash: grind (one's teeth) together as a sign of anger (often used hyperbolically); (of teeth) strike together; grind

		Mote: a tiny piece of a substance. A speck; scintilla, fleck, mite, grain

		Instar: a phase between two periods of molting in the development of an insect larva or other invertebrate animal

		Blandishment: a flattering or pleasing statement or action used as a means of gently persuading someone to do something; flattery, cajolery, fawning, smooth talk, charm offensive, ingratiating, simpering

		Curio: a rare unusual or intriguing object; trinket, bibelot, bauble, gimcrack

		Trochaic: (a) consisting of or featuring trochees; (n) a type of verse that consists of or features trochees

		Trochee: a foot consisting of one long or stressed syllable followed by one short or unstressed syllable (like iambic except the first syllable is long (/) and the second short (x))

		Spondaic: (cf trochaic in relations to trochee)

		Spondee: a foot consisting of two long (or stressed) syllables

		Anapestic:  (cf trochaic and anapest)

		Anap(a)est: a metrical foot consisting of two short or unstressed syllables followed by one long or stressed syllable

		Dactylic: (cf dactyl and trochaic)

		Dactyl: a metrical foot consisting of one stressed syllable followed by two unstressed syllables or (in Greek and Latin) one long syllable followed by two short syllable

		Anphibrach: a metrical foot consisting of a stressed syllable between two unstressed syllables

		Neume: (in plainsong) a note or group of notes to be sung to a single syllable

		Lilt: (n) a characteristic rising and falling of the voice when speaking; a pleasant gentle accent; cadence, inflection, emphasis, tempo, pulse, meter, beat, swing, sway, upswing, intonation; a pleasant, gently winging rhythm in a song or tune; (v) speak, sing, or sound with a lilt

		Bleary: (If the eyes) looking or feeling dull and unfocused from sleep or tiredness; rheumy, filmy, cloudy, dim, misty

		Gad: (informal) go from place to place in the pursuit of pleasure; gallivant, wander, rove, ramble, traipse, meander, stray, jaunt

		Gallivant: (informal) go around from one place to another in the pursuit of pleasure or entertainment

		Gouache: a method of painting using opaque pigments ground in water and thickened with a glue-like substance; opaque watercolor of the type used in gouache painting; a picture painted using the gouache method

		Belated: coming or happening later than should have been the case

		Adumbrate: represent in outline; indicate faintly; foreshadow (a future event); overshadow (ety: Latin "ad+umbrare" meaning "cast a shadow + to")

		Gamut: the complete range or scope of something; spectrum, sweep, scope, extent, scale; a complete scale of musical notes. The range of a voice or instrument; a scale consisting of seven overlapping hexachords containing all the recognized notes used in medieval music, covering almost three octaves from bass G to treble E; the lowest note in the gamut scale (ety: from "gamma ut" the name of the lowest note (bass G) in te medieval scale)

		Canthus: the outer or inner corner of the eye, where the upper and lower lids meet

		Kurort: a health resort, esp. in a German-speaking country or in the area of the former Soviet Union

		Kilmerite: relating to Joyce Kilmer (1886-1918), American poet mainly remembered for a short poem called "Trees" where Kilmer describes what he perceives as the inability of art to replicate the beauty achieved in nature

		Gnat: a small two-winged fly that resembles a mosquito. Guards include both biting and non-biting forms, and they typically form large swarms; a person regarded as tiny or insignificant

		Yucca: a plant of the agave family with sword like leaves and spikes of white bell-shaped flowers that are dependent upon the yucca moth for fertilization, native to warm regions of the US and Mexico

		Fir: an evergreen coniferous tree with upright comes and flat needle-shaped leaves, typically arranged in two rows. Firs are an important source of timber and resins

		Aspen: a poplar tree with small rounded long-stalked leaves that tremble in the breeze

		Lanugo: fine, soft hair, esp. covering the body and limbs of a human fœtus

		Rufous: (n,a) reddish brown in color (ety: Latin "rufus" meaning "reddish")

		Rufescent: tinged with red

		Lucerne: another term for alfalfa, a leguminous plant with clover-like leaves and bluish flowers, native to SW Asia and widely grown for fodder

		Kerb: (Brit) a stone edging to a pavement or raised path

		Steeple: (n) a church tower and spire; a spire on top of a church tower or roof; belfry, minaret, campanile, bell tower; (v) place (the fingers or hands) together so that they form and upward-pointing v-shape

		Spire: a tapering conical or pyramidal structure on the top of a building,  typically a church tower; the continuation of a tree trunk above the point where branching begins,  especially in a tree of a tapering form; a long tapering object; the upper tapering part of the spiral shell of a gastropod mollusc, comprising all but the whirl containing the body

		Belfry: the part of a bell tower or steeple in which bells are housed

		Minaret: a slender tower, typically part of a mosque, with a balcony from which a muezzin calls Muslims to prayer

		Campanile: an Italian bell tower, esp. a free standing one

		Reconnoitre: (v,n) make a military observation of (a region); survey, explore, scout (out), find out the lie of the land, investigate, scrutinize, scan, inspect, recon

		Shirk: avoid or neglect (a duty or responsibility; evade, dodge, sidestep,  shun, shrink from, skulk, malinger; be unwilling to do (something difficult)

		Lassitude: a state of physical or mental weariness; lack of energy; lethargy, languor, enervation, torpor, ennui, sloth, apathy, fatigue, listlessness, sluggishness

		Niggle: (v) (at) cause slight but persistant annoyance, discomfort, or anxiety; irritate, trouble, bother, exasperate, gall, irk, rankle with; criticize or annoy (someone) in a petty way; fuss, nag, carp, cavil, grumble, grouse; (n) a trivial criticism, discomfort, or annoyance

		Wolf: (n) a wild carnivorous mammal which is the largest member of the dog family, living and hunting in packs. It is native to both Eurasia and North American, but is much persecuted and has been widely exterminated; used figuratively to refer to a rapacious, ferocious, or varacious person; (informal) a man who habitually seduces women; womanizer, Casanova, Don Juan, Lothario, philanderer; (informal) a homosexual who seduces men or adopts an active role with a partner; a harsh or out-of-tune effect produced when playing particular notes or intervals on a musical instrument, caused either by the instrument's construction or by divergence from equal temperament; (v) devour (food) greedily; guzzle, gulp down, gorge oneself with, ingurgitate

		Lothario: a man who behaves selfishly and irresponsibly in his sexual relationships with women (ety: from a character in Rowe's fair penitent (1703))

		Redound: contribute greatly to (a person's credit or honor); come back upon. Rebound on (eg: may his sins redound upon his head)

		Thunderclap: a crash of thunder; used in similes to refer to something startling or unexpected

		(A)etiology: the cause, set of causes, or manner of causation of a disease or condition; the causation of diseases and disorders as a subject of investigation; the investigation or attribution of the cause or reason for something, often expressed in terms of historical or mythical explanation (unlike teleology)

		Alight: (v) descend from a train, bus, or other form of transport; (of a bird) descend from the air and settle; light, perch; (a, adv) on fire. Burning; ablaze, aflame, blazing, raging, fiery, afire; shining brightly; incandescent, radiant, brilliant, aglow

		Perch: (n) an object on which a bird alights or roosts, typically a branch or horizontal bar; a place where someone or something rests or sits, especially one that is high or precarious; an edible freshwater fish with a high spiny dorsal fin, dark vertical bars on the body, and orange lower fins (v) (of a bird) alight or rest on something; (of a person) sit on something high or narrow; (of a building) be situated above or on the edge of something; set or balance someone or something on

		Obeisance: deferential respect; deference, veneration, homage, worship; a gesture expressing deferential respect, such as a bow or curtsy

		Gulch: a narrow and steep-sided ravine marking the course of a fast stream

		Ravine: a deep, narrow gorge with steep sides

		Lament: (n) a passionate expression of grief or sorrow; wail, howl, jeremiad, ululation; a song, piece of music, or poem expressing grief or sorrow; dirge, requiem, elegy, keen, knell, coronach, threnody, monody, epicedium; a complaint; (v) express passionate grief about; express regret or disappointment about something; bemoan, bewail, deplore, rue

		Jeremiad: a long, mournful complaint or lamentation. A list of woes

		Threnody: a lament (ety: Greek "threnos +oide" meaning "wailing + song")

		Monody: an odd sung by a single actor in a Greek tragedy; a poem lamenting a person's death; music with only one melodic line

		Epicidium: a funeral ode

		Dirge: a lament for the deal, especially one forming part of a funeral rite; a mournful song, piece of music, or sound; (informal) a song or piece of music that is considered too slow, miserable, or boring

		Bemoan: express discontent or sorrow over (something); deplore, lament, bewail, keen over

		Bewail: express great regret, sadness, or disappointment about (something); rue

		Nag: (v) harass (someone) constantly to do something that they are averse to; badger, chivvy, berate, upbraid, bully, hound, harry; be persistently painful or worrying to; persistant, lingering, unrelenting, unremitting, unabated; (n) a person who nags someone to do something; shrew, harpy, termagant, harridan; a persistent feeling of anxiety

		Stagger: (v) walk or move unsteadily, as if about to fall; lurch, reel, sway, teeter, totter, flounder, pitch, roll; continue in existence or operation uncertainly or precariously; waver in purpose, hesitate. Falter; astonish or deeply shock; nonplus, astound, bewilder, flabbergast, stupefy, stun, daze, dumbfound, benumb, confound, disconcert, jolt; arrange (events, payments, hours, etc.) so that they do not occur at the same time (eg: staggered throughout the day); arrange (objects or parts) in a zigzag formation or so that they are not in line; (n) an unsteady walk or movement; an arrangement of things in a zigzag formation or so that they are not in line; the arrangement of the runners in lanes in a running track at the start of a race, so that the runner on the inside lane is positioned behind those in the next lanes

		Flounder: struggle or stagger clumsily in mud or water; struggle mentally. Show or feel great confusion; be in serious difficulty

		Rampant: (especially of something unwelcome) flourishing or spreading rapidly; unbridled, epidemic, rife, uncontrolled; unrestrained in action or performance (eg: rampant sex); (of a plant) lush in growth. Luxuriant; lush, exuberant, rank, vigorous, lavish, profuse; (of an animal) represented standing on one hind foot with its forefeet in the air (typically in profile facing the dexter side, with right hind foot and tail raised)

		Rife: (a) (esp. of something undesirable) of common occurrence. Widespread; insidious, ubiquitous, prevalent, pervasive; (with) full of; overrun by, bursting, swarming, teeming, seething; (adv) in an unchecked or widespread manner (eg: speculation ran rife)

		Languor: tiredness or inactivity, especially when pleasurable; indolence, idleness, somnolence; an oppressive stillness of the air (eg: heavy with languor)

		Chisel: (n) a long-bladed hand tool with a beveled cutting edge and a handle which is struck with a hammer or mallet, used to cut or shape wood, stone, or metal; (v) cut or shape (something) with a chisel

		Bevel: (n) a slope from the horizontal or vertical in carpentry and stonework. A sloping surface or edge; a tool for marking angles; (v) reduce (a square edge on an object) to a sloping edge

		Filigree: ornamental work of fine (typically gold or silver) wire formed into delicate tracery

		Pipe: (as v) convey (water, gas, oil, or other fluid substances) through a pipe or  pipes; transmit (music, radio or television programme, signal, etc.) by wire or cable; play (a tune) on a pipe or pipes; play a pipe or pipes as a ceremonial accompaniment to the arrival or departure of (someone); use a boatswain's whistle to summon (the crew) to work or a meal; (of a bird) sing in a shrill voice; chirp, chirrup, twitter, shrill, squeak, squeal, chatter, warble, trill, peep; say something in a high, shrill voice; decorate (clothing or soft furnishings) with thin cord covered in fabric and inserted into a seam; propagate (a pink or similar plant) by taking a cutting at the joint of a stem

		Disparate: (a) essentially different in kind. Not able to be compared; dissimilar, divers, myriad, divergent, various; containing elements very different from one another; (n, archaic) things so I like that there is no basis for comparison

		Jettison: (v) throw or drop (something) from an aircraft or ship; abandon or discard (someone or something that is no longer wanted); (n) the action of jettisoning something

		Jeopardize: put (someone or something) into a situation in which there is a danger of loss, harm, or failure; imperil, compromise, prejudice, endanger

		Imperil: put at risk of being harmed, injured, or destroyed

		Prejudice: (n) preconceived opinion that is not based on reason or actual experience; harm or injury that results or may result from some action or judgement; (v) give rise to prejudice in (someone). Make biased; jaundice, warp, twist, distort, sway, predispose; cause harm to (a state of affairs); mar, spoil, impair, compromise

		Languid: (of a person, manner, or gesture) having or showing a disinclination for physical exertion or effort; (of a period of time) relaxed and peaceful; weak or faint from illness or fatigue; feeble, frail, delicate, weary

		Casuistry: the use of clever but unsound reasoning, especially in relation to moral questions; sophistry, sophism, chicanery, specious reasoning, equivocation; the resolving of moral problems by the application of theoretical rules

		Sophistry: the use of clever but false arguments, especially with the intention of deceiving; a fallacious argument

		Sophist: a paid teacher of philosophy and rhetoric in Greece in the classical and Hellenistic periods, associated in popular with moral scepticisme and specious reasoning; a person who reasons with clever but false arguments

		Sophism: a clever but false argument, especially one used deliberately to deceive

		Deride: express contempt for. Ridicule; pillory, slight, disparage, denigrate, scorn, satirize, lampoon

		Adulation: excessive admiration or praise; worship, lionization, veneration, awe, idolizations, plaudits, blandishments, laudation, tributes, glorification

		Plaudits: praise; the applause of an audience

		Bear (bore, borne): (as v) (of a person) carry; convey, fetch, haul, lug; (of a vehicle or boat) convey (passengers or cargo); have or display as a visible mark or feature; be called by (a name or title); carry or conduct oneself in a specified manner (eg: she bore herself with dignity); support. Carry the weight of; buttress, brace; take responsibility for; be able to accept or stand up to; endure (an ordeal or difficulty); withstand, tolerate, suffer, stand, abide, countenance, brook; give birth to (a child); beget, spawn, procreate, conceive, breed; (of a tree or plant) produce (fruit or flowers); bestow, yield, generate; turn and proceed in a specified direction; veer, fork

		Countenance: (n) a person's face or facial expression; physiognomy, mien, visage; support or approval; (v) admit as acceptable or possible; tolerate, brook, approbate, swallow, stomach, bear

		Mien: a person's appearance or manner, esp. as an indication of their character or mood; countenance, aura, demeanor, deportment, stance, carriage, bearing, attitude, air, comportment, expression, aspect

		Bestow: confer or present (an honor, right, or gift); grant, vouchsafe, bequeath to, consign to, apportion to, lavish on; (archaic) put (something) in a specified place

		Fleck: (n) a very small patch of color or light; spot, speck, freckle, streak, blot, splash, dab, petechia, macula; a small particle or speck of something; (v) mark or dot with small patches of color or particles of something

		Macule: an area of skin discoloration

		Confide: tell someone about a secret or private matter while trusting them not to repeat it to others; (in) trust (someone) enough to tell then of a secret it private matter; entrust something to (someone) in order for them to look after it

		Hamstring: (n) any of the five tendons at the back of a person's knee; thebgreat tendon at the back of a quadruped's hock; (v) cripple (a person or animal) by cutting their hamstrings; severely restrict the efficiency or effectiveness of; frustrate, bridle, fetter, hamper, hinder, obstruct, inhibit, retard, foil, thwart, curb, curtail, trammel

		Hock: the joint in a quadruped's hind leg between the knee and the fetlock, the angle of which points backwards; a knuckle of mean, especially of pork or ham

		Fetlock: the joint of a horse's or other quadruped's leg between the cannon bone and the plastern

		Lame: (n) (of a person or a animal) unable to walk without difficulty as the result of an injury or illness affecting the leg or foot; (of a leg or foot) affected by injury or illness; (of an explanation or excuse) unconvincingly feeble; flimsy, hollow, thin, puny; (of something intended to be entertaining) uninspiring and dull; (of verse or metrical feet) halting. Metrically defective; (v) make (a person or animal) lame

		Palindrome: a word, phrase, or sequence that reads the same backwards as forwards, such as "madam" or "nurses run"

		Temporize: avoid making a decision or committing oneself in order to gain time; equivocate, stall, tergiversate, prevaricate, hum and haw, use Fabian tactics

		Prosopography:  a description of a person's appearance, personality, career, etc., or a collection of such descriptions; the study of prosopographies, esp. as an aspect of the study of Roman history (ety: Greek "prosopon + graphia" meaning "face, person + writing

		Shriek: (v,n) utter a high pitched piercing sound or words, esp. as an expression of terror, pain, or excitement; scream, screech, squeal, squall, howl, bellow, bawl, yell, cry, caterwaul, wail, whoop; (of something inanimate) make a high pitched screeching sound; be very obvious or strikingly discordant

		Expletive: an oath or swear word; curse, obscenity, imprecation; a word or phrase used to fill out a sentence or a line of verse without adding to the sense

		Interloper: a person who becomes involved in a place or situation where they are not wanted or are considered not to belong; intruder, encroacher, invader, stranger, outsider

		Wicket: (cricket) each of the sets of three stumps with two bails across the top at either end of the pitch, defended by a batsman; the prepared strip of ground between two sets of stumps; the dismissal of a batsman; a small door or gate, esp. one beside or in a larger one; an opening in a door or wall, often fitted with glass or a grille and used for selling tickets or a similar purpose; a croquet hoop

		Stump: (n) the bottom part of a tree left projecting from the ground after most of the trunk has fallen or been cut down; the small projecting remnant of something that has been cut or broken off or worn away;  each of the three upright pieces of wood which form a wicket; a cylinder with conical ends made of rolled paper or other soft material, used for softening or blending marks made with a crayon or pencil; (on the stump) used in relation to political campaigning; (v) be at a loss. not know what to do or say; walk stiffly and noisily; stomp, clomp, lumber, trudge, plod; travel around (a district) making political speeches; (art) use a stump on (a drawing, line, etc.)

		Atrophy: (v,n) (of body tissue or an organ) waste away, esp. as a result of the degeneration of cells, or become vestigial during evolution; wither, wilt, shrivel, decay; gradually decline in effectiveness or vigor due to underuse or neglect; dwindle, wane, fade, subside, crumble (ety: Greek "a + trophe" meaning "without + food")

		Wane: (of the moon) have a progressively smaller part of its visible surface illuminated, so that it appears to decrease in size; (of a state or feeling) decrease in vigor or extent. Become weaker; decline, ebb, dim, remit, dwindle, shrink, subside, droop, attenuate, peter out, abate, recede, slump, atrophy, deteriorate, melt away, wither, degenerate, evanesce

		Evanesce: pass out of sight, memory, or existence

		Decline: (v,n) (typically of something regarded as good) become smaller, fewer, or less. Decrease; politely refuse (an invitation or offer); (esp. of the sun) move downwards; (in the grammar of Latin, Greek, and certain other languages) state the forms of (a noun, pronoun, or adjective) corresponding to case, number, and gender

		Chop: (v) cut (something) into pieces with repeated sharp blows of an axe or knife; mince, dice; hew, split, cleave; (off) remove something by cutting; (down) cut through the base of (a tree) with blows from an axe or other implement, in order to fell it; strike (something) with a short heavy blow, as if cutting at something; abolish or reduce the size of (something) in a way regarded as ruthless; (n) a downward cutting blow or movement, typically with the hand; a thick slice of meat, especially pork or lamb, adjacent to and often including a rib; crushed or ground grain used as animal feed; the broken motion of water, owing to the action of the wind against the tide

		Correlate: (v) have a mutual relationship or connection; in which one thing affects or depends on another; establish a mutual relationship or connection between; (n) each of two or more related or complementary things

		Sally: (n) the part of a bell rope that has colored wool woven into it to provide a grip for the bell-ringer's hands; a sudden charge out of a besieged place against the enemy. A sortie; foray, sortie, thrust, offensive, blitz, onset, incursion, onslaught, razzia; a brief journey or a sudden start into activity; a witty or lively remark, esp. one made as an attack or as a diversion in an argument. A retort; witticism, quip, barb, epigram, aphorism, jest, riposte, counter, rejoinder, retaliation, bon mot; (v) make a military sortie; (sallied forth) (formal, humorous) set out from a place to do something

		Wither: (of a plant) become dry and shriveled; wilt, droop, perish, become marcescent; (of a part of the body) become shrunken or wrinkled from age or disease; atrophy, decay; fall into decline; (of the State in Marxist theory) cease to exist because no longer necessary after the dictatorship of the proletariat has implemented the necessary changes in society; humiliate (someone) with a scornful look or manner

		Hollow: (a) having a hole or empty space inside; void, vacant, unfilled; having a concave or sunken appearance; incurvante, sunken, deep-set, caved in; without real significance or value; pyrrhic, futile, worthless, bootless, unavailing, fruitless, pointless; insincere. Artificial; feigned, cynical, spurious, sham, deceitful, dissembling; (n) a hole or depression in something; pit, cavity, crater, trough, nook, cranny, basin, recess, concavity; an enclosed space within something; a small valley; valley, vale, dale, dell, dingle; (v) (out) form by making a hole; make a hollow in

		Dissemble: conceal or disguise one's true feelings or beliefs; feign, posture, pose, bluff, counterfeit, veil, shroud, hide, mask; disguise or conceal (a feeling or intention)

		Hallow: (v) honor as holy; (usually as hallowed) make holy. Consecrate; sacrosanct, divine, inviolable, blest, blessed, sanctified, revered; greatly revere and honour; (n) a saint or holy person

		Bellow: (v,n) (of a person or animal) emit a deep loud roar, typically in pain or anger; (v) (out) shout something with a deep loud roar; sing (a sing) loudly and tunelessly

		Coot: an aquatic bird of the rail family, with blackish plumage, lobed feet, and a bill that extends back on to the forehead as a horny shield; (informal) a stupid or eccentric person, typically an old man

		Tuft: (n) a bunch or collection of threads, grass, hair, etc., held or growing together at the base; clump, tussock, tuffet, lock, wisp, crest, tassel, panache; a bunch of small blood vessels, respiratory tentacles, or other small anatomical structures; (v) provide with a tuft or tufts; strengthen (upholstery) by passing a cluster of threads through the material, so making depressions at regular intervals

		Tussock: a small area of grass that is thicker or longer than the grass growing around it

		Tassel: (n) a tuft of loosely hanging threads or cords knotted at one end and attached for decoration to soft furnishings, clothing, or other items; the tufted head of some plants, especially a flower head with prominent stamens at the top of a maize stalk; a small piece of stone or wood supporting the end of a beam or joist; (v) provide with a tassel or tassels; (of maize or other plants) form tassels

		Frankfurtian: relating to the Frankfurt school of neo-Marxist interdisciplinary social theory, founded during the interwar period, who believed that traditional theory could not adequately explain the turbulent and unexpected development of capitalist societies. Critical of both capitalism and soviet socialism

		Nimbus: a luminous cloud or a halo surrounding a supernatural being or saint; a light, color, etc., that surrounds someone or something; a large grey rain cloud

		Anthracite: coal of a hard variety that contains relatively pure carbon and burns with little flame and smoke; a dark grey color (ety: Greek "anthrax" meaning "coal, carbuncle")

		Honeysuckle: a widely distributed climbing shrub with tubular flowers that are typically fragrant and of two colors or shades, opening in the evening for pollination by moths

		Interlace: cross or be crossed intricately together. Interweave; mingle or intersperse something with

		Jittery: nervous or unable to relax

		Blunder: (v,n) make a stupid or careless mistake. Act or speak clumsily; err, bungle; (v) move clumsily or as if unable to see; stumble, lurch, stagger, falter, flounder, muddle, struggle, fumble

		Pomp: (n) ceremony and splendid display; ritual, pageant; vain and ostentation display

		Scant: (n) barely sufficient or adequate; meager, exiguous; barely amounting to a specified number or quantity; (v) provide grudgingly or in insufficient amounts; deal with inadequately; neglect

		Clad: (v) archaic or literary past participle of clothed; encase (a structure) with a covering or coating; (a) clothed; covered with cladding

		Garb: clothing, esp. of a distinctive or special kind; raiment, habit, apparel, regalia, finery; (v) dress in distinctive clothes; bedizen, accoutre, attire

		Accouter: clothe or equip in something noticeable or impressive

		Delectation: (formal, humorous) pleasure and delight

		Catch as catch can: (n) (archaic) wrestling in which all holds are permitted; a situation of using whatever is available

		Congeneric: (of an animal or plant species) belonging to the same genus; or a related nature or origin

		Pharisaic: relating to the Pharisees; (lowercase) practicing or advocating strict observance of external forms and ceremonies of religion or conduct without regard to the spirit. Self-righteous, hypocritical

		Pharisee: a member of an ancient Jewish sect, distinguished by strict observance of the traditional and written law, and commonly held to have pretensions to superior sanctity; a self righteous or hypocritical person

		Tawny: (n,a) an orange-brown or yellowish-brown color

		Toady: (v,n) (of a person) act in an obsequious way; sycophant, fawner, minion

		Duenna: an older woman acting as a governess and companion in charge of girls, esp. in a Spanish family. A chaperone

		Understudy: (n,v) (in the theatre) a person who learns another's role in order to be able to act at short notice in heir absence; substitute, surrogate, fill-in, standby, locum tenens

		Acrosonic: (word invented by Nabokov) a noise reaching to and past the sonic barrier

		Philter: a drink supposed to arouse love and desire for a particular person in the drinker. A love potion

		Hanker: (for, after) feel a strong desire for or to do something; yearn, long, crave, lust, ache, hunger, thirst, fancy, suspire

		Hoodwink: (into, by) deceive or trick; dupe, fool, delude, hoax, mislead, defraud, swindle, gull, finagle, bamboozle, mulct, befool

		Saunter: (v,n) walk or stroll in a slow, relaxed manner; stroll, meander, drift, amble, wander, maunder, potter, promenade, ramble, perambulate

		Rap: strike (a hard surface) with a series of rapid audible blows, esp. in order to attract attention; strike (something) several times against a hard surface; strike sharply with a stick or similar implement; (out) say sharply or suddenly

		Fey: (a) giving an impression of vague unworldliness or mystery; having supernatural powers of clairvoyance; (Scottish, archaic) fated to die or at the point of death

		Dram: (Scottish) a small drink of whisky or other spirit; another spelling of drachm

		Drachm: a unit of weight formerly used by apothecaries, equivalent to 60 grains or one eighth of an ounce; a liquid measure formerly used by apothecaries equivalent to 60 minims or one eight of a fluid ounce

		Talon: a claw, esp. one belonging to a bird of prey; the part of a bolt against which the key presses to slide it in a lock; (in various card games) the cards that have not yet been dealt; a printed form attached to a bearer bond that enables the holder to apply for a new sheet of coupons when the existing coupons have been used up; an ogee molding

		Ogee: (a) showing in section a double continuous S-shaped curve; (n) an S-shaped line or molding

		Incommunicado: not able, wanting, or allowed to communicate with other people

		Swain: a young lover or suitor; a country youth

		Repugnant: extremely distasteful. Unacceptable; abhorrent, revolting, vile, foul, loathsome, sickening, execrable, abominable, deplorable, insufferable, intolerable, despicable, contemptible,  noxious, obscene, base, hideous, monstrous, gruesome, heinous, frightful, unpalatable,  nauseating, detestable, scurvy, loathly, rebarbative; in conflict or incompatible with; (archaic) given to stubborn resistance (ety: Latin "repugnare" meaning "opposing")

		Inquest: a judicial inquiry to ascertain the facts relating to an incident; probe, enquirer, investigation, review; an inquiry by a coroner's court into the causes of a death

		Alembic: a distilling apparatus, now obsolete, consisting of a gourd-shaped container and a cap with a long beak for conveying the product is to a receiver

		Thunderhead: a rounded, projecting head of a cumulus cloud, which portends a thunderstorm

		Cumulus: cloud forming rounded masses heaped on each other above a flat base at fairly low altitude

		Polyp: a solitary or colonial sedentary form of a coelenterate such as a sea anemone, typically having a columnar body with the mouth uppermost surrounded by a ring of tentacles; a small growth, usually benign and with a stalk, protruding from a mucous membrane

		Coelenterate: an aquatic invertebrate animal of a phylum that includes jellyfishes, corals, and sea anemones. They usually have a tube or cup shaped body with a single opening ringed with tentacles that bear stinging cells (nematocysts)

		Sienna: a kind of ferruginous earth used as a pigment in painting, normally yellowish brown in color (raw sienna) or deep reddish-brown when roasted (burnt sienna); a yellowish or deep-reddish brown color

		Ferruginous: containing iron oxides or rust; reddish brown. Rust colored

		Brocade: a rich fabric woven with a raised pattern, typically with gold or silver threads

		Agate: an ornamental stone consisting of a hard variety of chalcedony, typically banded in appearance; a colored toy marble resembling a banded gemstone

		Placate: make (someone) less angry or hostile

		Magnanimous: generous or forgiving, esp. towards a rival or less powerful person; munificent, altruistic, philanthropic, clement, bounteous, unstinting

		Supplant: supersede and replace; overthrow, oust, dethrone, topple, defenestrate

		Sinecure: a position requiring little or no work but giving the holder status or financial benefit

		Misprision: the deliberate concealment of one's knowledge of a treasonable act or felony; failure to appreciate or recognize the value or identity of something

		Paunch: (n) a large or protruding belly; (v) disembowel (an animal)

		Calisthenics: gymnastic exercises to achieve bodily fitness and grace of movement

		Ectoplasm: the more viscous, clear outer layer of the cytoplasm in amoeboid cells; a supernatural viscous substance that supposedly exudes from the body of a medium during a spiritualistic trance and forms the material for the manifestation of spirits

		Abstracted: lacking concentration on what is happening around one; absent-minded, dreamy, musing, wool gathering, distrait, oblivious, heedless, distracted

		Distrait: distracted or absent-minded

		Wool-gathering: indulgence in aimless thought or dreamy imagining. Absent-mindedness

		Bank: (sense 1) (n) the land alongside or sloping down to a river or lake; embankment, levee, skirt, bourn, marge, boundary, flank; a long, high mass or mound of a particular substance; an elevation in the seabed or a riverbed. A mudbank or sandbank; a transverse slope given to a road, railway, or sports track to enable vehicles to maintain speed round a curve; (angle of bank) the sideways tilt of an aircraft when turning in flight; a set of similar things, esp. electrical or electronic devices, grouped together in rows; a tier of oars; the cushion of a pool table; (v) heap (a substance) into a mass or mound; form into a mass or mound; heap up (a fire) with tightly packed fuel so that it burns slowly; edge or surround with a ridge or row of something; (with reference to an aircraft or vehicle) tilt or cause to tilt sideways in making a turn; build (a road, railway, etc.) higher at the outer edge; (of an angler) succeed in landing (a fish)

		Intimate: (n) a very close friend; (a) closely acquainted; (of a place or setting) having a cosy and private or relaxed atmosphere;  (euphemistic) having a sexual relationship; (v) state or make known; imply or hint

		Vault: (n) a roof in the form of an arch or a series of arches, typical of churches and other large, formal buildings; a thing resembling an arched roof, esp. the sky;  the arched roof of a cavity, especially that of the skull; a large room or chamber used for storage, esp. an underground one; a chamber beneath a church or in a graveyard used for burials; catacomb, sepulcher, undercroft; (v) provide (a building or room) with an arched roof or roofs; embowed, domed, humped; construct (a roof) in the form of a vault

		Embowed: bent, arched, or vaulted; (heraldry) (of an arm) bent at the elbow or (of a dolphin) with the body curved

		Skulk: (v) keep out of sight, typically with a sinister or cowardly motive; move stealthily or furtively; lurk, loiter, sidle, slink, creep, prowl, pussyfoot; shirk one's duties or responsibilities; (n) a group of foxes

		Loiter: stand or wait around without apparent purpose; linger, skull, potter, laze, idle, tarry; walk slowly and with no apparent purpose. Dawdle; dally, stroll, saunter, loll

		Laze: (v) spend time in a relaxed, lazy manner; pass time one a relaxed, lazy way; (n) a spell of lazing around

		Pussyfoot: act in a cautious or non-committal way; equivocate, prevaricate, hedge, fence, vacillate, tergiversate; move stealthily or warily

		Prowl: (v,n) (of a person or animal) move about restlessly and stealthily, esp. I search of prey

		Croon: (v) hum or sing in a soft, low voice, esp. in a sentimental manner; lilt, warble; say in a soft low voice; (n) a soft low voice or tone

		Caw: (n,v) the harsh cry of a rook, crow, or similar bird

		Commodious: roomy and comfortable; convenient

		Gloom: (n) partial or total darkness; murk, obscurity, tenebrosity, dusk, twilight, gloaming, shade; a dark or shady place; a state of depression or despondency; melancholy, sorrow, woe, misery, dejection, mopery, Weltschmerz, despair; (v) have a dark or sombre appearance; make dark or dismal; be or look depressed or despondent

		Murk: darkness or thick mist that makes it difficult to see

		Dusk: (n) the darker stage of twilight; semi-darkness (v) grow dark; (a) shadowy, dim, or dark

		Demesne: a piece of land attached to a mannor or retained by the owner for their own use; the lands of an estate; a region or domain; possession of real property in one's own right

		Twilight: the soft glowing light from the sky when the sun is below the horizon, caused by the reflection of the sun's ray from the atmosphere; the period of the evening when twilight is visible, between daylight and darkness; a period or state of obscurity, ambiguity, or gradual decline

		Gloaming: twilight. Dusk

		Yew: a coniferous tree which has red berry-like fruits, and most of which are highly poisonous. Yews are linked with folklore and superstition and can live to a great age; the timber is used in cabinetmaking and (formerly) to make longbows

		Weltschmerz: a feeling of melancholy and world-weariness

		Machicolation: (in medieval fortifications) an opening between the supporting corbels of a projecting parapet or the vault of a gate, through which stones or burning objects could be dropped on attackers; a projecting structure containing a series of machicolations

		Corbel: (n) a projection jutting out from a wall to support a structure above it; support (a structure) or corbels

		Gormless: (British, informal) lacking sense or initiative. Foolish

		Groggy: dazed, weak, or unsteady, especially from illness, intoxication, sleep, or a blow; muzzy, fuddled, muddled, disoriented, wobbly

		Slosh: (v) (of a liquid or container) move irregularly with a splashing sound; spatter, splatter; move through liquid with a splashing sound; swash, squelch, wade; pour (liquid) clumsily; (n) an act or sound of splashing; a quantity of liquid that is poured out

		Homeric: relating to or in the style of Homer (8 or 7 century BC) or the epic poems ascribed to him; relating to Bronze Age Greece as described in the Homeric poems; epic and large-scale

		Voluptas: Roman goddess of sensual pleasure, "voluptas" meaning "pleasure" or "delight", she is the daughter of Cupid and psyche

		Dwindle: diminish gradually in size, amount,  or strength

		Host (sense 2): a large number of people or things; multitude, myriad, abundance; an army; (in biblical use) the angels regarded collectively; the sun, moon, and stars (eg: the host of heaven); a flock of sparrows; the bread consecrated in the Eucharist

		Expectorate: cough or spit out (phlegm) from the throat or lungs

		Jarring: incongruous in a striking or shocking way; clashing; causing a physical shock, jolt, or vibration

		Jar: (v) send a painful or damaging shock through (something, especially a part of the body); jolt, concuss, rattle; (on) strike against something with an unpleasant vibration or jolt; (on) have an unpleasant, annoying, or disturbing effect; (with) incongruous in a striking or shocking way; (n) a physical shock or jolt

		Inveigh: speak about something with great hostility; fulminate against, rail against, condemn, decry, disparage, denigrate, vituperate, impugn

		Inveigle: (into) persuade (someone) to do something by means of deception or flattery; lure, cajole, wheedle, coax

		Heave: (v) lift or haul (a heavy thing) with great effort; lug, heft; produce a sigh; (n)  an act of heaving

		Riddle: (n) question phrased so as to require ingenuity in ascertaining its answer; large coarse sieve to separate ashes from cinders or sand from gravel; (v) pose riddles; solve or explain (a riddle to someone); make many holes (in someone or something) especially with gunshots; perforate, pepper; fill or permeate with something undesirable or unpleasant

		Heyday: the period of a person's or thing's greatest success, popularity, or vigor; prime, pinnacle, apex, acme, zenith, bloom, flowering, prime of life, halcyon days, salad days (latter: Shakespearean idiom, period of ones life when one is green and youthful

		Etch: engrave by coating with protective layer, drawing with needle, and cover with acid to attack the exposed parts to produce a print

		Monotype: etched drawing (started by ludovic Napoleon lepic, popularized by degas without the etching part)

		Lithography: printing from a surface treated so as to repel ink except where required

		Tout: (v, n) (of a person) attempt to sell (something) typically by pestering people in an aggressive or bold manner; offer racing tips for a share of any resulting winnings; a person acting in such a way

		Straddle: (v) sit or stand with one leg on either side of; place one's legs wide apart; walk in such a way; extend across or be situated on both sides of, span; maintain an equivocal position on; (n) act of sitting with legs apart; simultaneous purchase of options to buy and sell a commodity at a fixed price to make a profit

		Careen: turn a ship on its side for cleaning, caulking, or repairing; move swiftly and in an uncontrolled way in a specified direction

		Wend: Go in a specified direction, typically slowly or by an indirect route; drift, roam, traipse, saunter, stroll, meander, wander

		Indolent: wanting to avoid activity or exertion; lazy, idle, slothful, shiftless, languid, lackadaisical, lethargic, torpid, sluggish,

		Ecstatic: feeling or expressing overwhelming happiness or joyful excitement; enraptured, rapturous, elated, euphoric, blissful, exultant

		Abrade: scrape or wear away by friction or erosion; wear away/down, erode, corrode, gnaw away at, eat away at

		Facetious: treating serious issues with deliberately inappropriate humor; flippant, frivolous, sardonic

		Licentious: promiscuous and unprincipled in sexual matters; dissolute, debauched, wanton, decadent, depraved, lustful, lecherous, lascivious, libidinous, prurient, concupiscent, lewd

		Swill: (n, v) drink (something) greedily or in large quantities (e.g. Swilling pints of beer); down, gulp, chug

		Posture: (v) behave in a way that is intended to impress or mislead others

		Flagellation: flogging or beating, either as a religious discipline or for sexual gratification

		Declension: variation in form of noun or other in latin, Greek, other language; a condition of decline or moral deterioration

		Rave: laud, eulogize, extol, rhapsodize over, go into raptures over, wax lyrical about, overpraise

		Whiggish: relating to, or characterized by a view which holds that history follows a path of inevitable progression and improvement, and which judges the past in light of the present (e.g. Manifest destiny)

		Moribund: (person) at the point of death; (thing) in terminal decline; lacking vitality or vigor; crumbling, stagnant

		Aegis: protection, backing, or support of a particular person or organization; patronage, agency, auspices, safeguarding

		Jeremiad: long, mournful complaint or lamentation, list of woes

		Ancillary: (a, n) providing necessary support to the primary activities of an organization

		Chafe: (v, n) (of something restrictive or too tight) make or become sore by rubbing; rub abrasively; rub to restore warmth of sensation; become or make annoyed or impatient because of restriction or inconvenience (fume, exasperate)

		Excoriate: censure or criticize severely; damage or remove part of the surface of (the skin)

		Cantankerous: bad-tempered, argumentative, and uncooperative

		Rancor: long-standing resentful was or bitterness; spite

		Malice: the intention to do evil; ill will, vindictiveness, malevolence, vengefulness, enmity

		Aerie: a large nest of a bird of prey, typically build high in a tree or on a cliff

		Eerie: strange and frightening; uncanny (strangely familiar), sinister, blood-curdling, spine-chilling/tingling, hair-raising, odd, freakish, otherworldly, unearthly, sinister

		Curdle: separate or cause to separate into curds or lumps; clot, coagulate, congeal, turn, sour, ferment

		Curd: substance formed when milk sours, used as the basis for cheese; the edible head of a cauliflower or similar plant

		Baleful: threatening harm, menacing, antagonistic, malign, malefic, pernicious, injurious, hostile

		Sinister: giving the impression that something harmful or evil is happening or will happen; ominous, forbidding disquieting, minatory, direful,

		Besmirch: damage the reputation; sully, tarnish, smear, debase, slander, malign, defame, besmear, smirch; make (something) dirty or discolored

		Legerdemain: skillful use of ones hands when performing tricks (esp. deceptively) sleight of hand, prestidigitation, skulduggery, deceit, chicanery, cunning

		Chicanery: use of trickery to achieve political, financial, or legal purpose; subterfuge, underhandedness, duping, knavery

		Knave: a dishonest or unscrupulous man; jack in a deck of cards

		Scrupulous: diligent, meticulous, sedulous, punctilious; very concerned to avoid doing wrong; honorable,  virtuous, principled

		Ire: anger, rage, fury, wrath, choler (medieval: one of the four bodily humors, associated with peevish or angry behavior), irascible

		Bauble: a small, showy trinket or decoration; bibelot, knickknack; something superficially attractive but useless or worthless

		Vie: compete eagerly in order to achieve something; war, feud, jockey

		Reap: cut or gather a crop or harvest

		Churn: (v) agitate or turn (milk or cream) in a machine in order to produce butter; move about vigorously; (n) machine where churning takes place

		Graze: (animal) eat grass in a field; feed, nibble, browse, ruminate; put animals to feed on land covered by grass; (informal) casually sample something (e.g. TV channels); (v, n) scrape the skin so as to break to surface but cause little or no bleeding; scrape, abrade, skin, bark, scuff, rasp, chafe; scrape lightly in passing; brush, shave, kiss, scrape, clip, glance off

		Dim: (v, n) (light, color, illuminated object) faint, feeble, pale, dull, subdued, muted;   Not clearly recalled or formulated in the mind; vague, sketchy, hazy, blurred, shadowy

		Foible: minor weakness or eccentricity of character; shortcoming, blemish, flaw, defect, kink, idiosyncrasy; (fencing) weaker part of a sword blade

		Rankle: (v) (wound, sore; comment, event, fact) continue to be painful, fester; annoy or irritate

		Rile: make water turbulent muddy, or turbid by disturbing the sediment; roil; (informal) annoy;

		Turbid: (liquid) cloudy, opaque, murky, roily; confused or obscure in meaning or effect

		Seethe: (liquid) bubble up as a result of boiling (simmer, foam, froth, effervesce); be filled with intense but unexpressed anger (fume, smolder); be crowded with things or people moving about in a rapid or hectic way (teeming); (of a crowd) move in a hectic way

		Maunder: talk in a rambling manner; ramble, prattle, blather, jabber, rattle, babble; move or act in a dreamy or idle manner; wander, drift, meander, amble, putter

		Blather: (v, n) talk long-windedly without making much sense; prattle, twitter, prate, yap, burble, drivel, blabber, gab; (informal) bloviate

		Burble: (v, n) make a continuous murmuring noise; murmur, putt, whirr, hum, rumble

		Prate: talk foolishly or tediously about something; prattle

		Putter: occupy oneself in a desultory but pleasant manner, doing a number of small tasks, not concentrating on anything in particular; move or go in a casual, unhurried way.

		Amble: (v,n) walk at a slow, relaxed pace; stroll, saunter, promenade, perambulate

		Meander: (v, n) (of a river or road) follow a winding course; bend, snake, curl, curve, wind; wander at random; (speaker or text) proceed aimlessly

		Rattle: (v, n) make or cause a rapid succession of short, sharp knocking sounds; cause to feel nervous, worried, or irritated; fluster, perturb, discompose, discomfit, ruffle, throw; (informal) faze; (n) clatter, clink, clank, jingle, jangle

		Cowlick: a lock of hair that grows in a direction different from the rest and that resists being combed flat

		Misanthropic: disliking humankind and avoiding human society; unsociable, reclusive, uncongenial

		Jaundiced: affected by bitterness, resentment, or envy; resentful, cynical, soured

		Hobgoblin: (in mythology or fairy tales) a mischievous imp or Sprite, fearsome mythical creature (puck, leprechaun, bugbear, bogeyman

		Bugbear: imaginary being invoked to frighten children (sort of hobgoblin supposed to devour them; a cause of obsessive fear, irritation, or loathing; pet peeve, Bête noir, anathema, aversion, bane, torment, thorn in one's flesh/side

		Peeve: (active, passive) (v,n) annoy, irritate, exasperate, irk, gall, pique, nettle, ruffle the feathers; irritated, cross, disgruntled, aggrieved, in high dudgeon

		Reductio ad absurdum: (argumentum ad absurdum) form or argument which seeks to demonstrate truth, by showing that a false, untenable, or absurd result follows from its denial, or acceptance

		Flicker: (or a light) shine unsteadily; vary rapidly in brightness; glimmer, glint, flare, dance, gutter, twinkle, sparkle, scintillate, glister, coruscate; make small, quick movements, flutter rapidly; quiver, shudder, spasm, jerk, twitch

		Obscurantism: act of deliberately preventing facts or full details from being known

		Sartorial: of or relating to clothes, tailoring, or style of dress

		Melancholy: (n,a) a feeling of pensive sadness, typically with no obvious cause; despondent, lugubrious, disconsolate, woebegone, morose, atrabilious (black bile), forlorn, doleful, gloomy, glum, desolate, dejected, dismal, crestfallen, wretched; melancholia, cafard, sorrow, woe, misery

		Gaudy: extravagantly bright or showy, typically so as to be tasteless (e.g. Sevres porcelain); garish, lurid, glaring, glittering, brassy, ostentatious, tawdry, bilious

		Astringent: causing the contraction of body tissues, esp. the skin; sharp or severe in manner or style

		Bliss: perfect happiness, great joy; (blissed-out) reach a state of perfect happiness, typically so as to be oblivious of everything else

		Bestow: confer on, endow with, vest in

		Venal: susceptible to bribery; mercenary

		Mercenary: (a) (derogatory) (of a person or behavior) primarily concerned with making money at the expense of ethics

		Avuncular: of or relating to an uncle; kind and friendly toward a younger or less experienced person

		Avail: (oneself of) use to ones advantage; (nil) help or benefit

		Fustian: (n) thick, durable, twilled cloth with a short nap; pompous or pretentious speech or writing

		Twill: (v, n) a fabric so woven as to have a surface of diagonal parallel ridges

		Laggard: (n,a) slower than desired or expected

		Fumble: clumsily handle something

		Superb: excellent; impressively splendid; glorious, admirable, magnificent; breathtaking, grand

		Importunate: persistent, esp. To the point of annoyance or intrusion

		Impute: attribute (something undesirable to); ascribe by virtue of a similar quality in another

		Loquacious: tending to talk a great deal; talkative

		Trough: long, narrow, open container for animals to drink or eat in; channel used to convey a liquid; ditch, gully, trench

		Disrepute: (in, into) being held in low esteem by the public; ignominy, ill repute, opprobrium, obloquy

		Fawn: give a servile display of exaggerated flattery or affection, typically in order to gain favor or advantage

		Contented: happy and at ease

		Wade: walk through water or another liquid or soft substance

		Abandon: (n) complete lack of inhibition or restraint

		Embosom: take or press to one's bosom; embrace; enclose or surround protectively

		Sidle: walk in a furtive, unobtrusive, or timid manner, esp. sideways or obliquely

		Piacular: requiring atonement

		Dilettante: person who takes up activity in a superficial way, without commitment or knowledge

		Obnubilate: darken, dim, or cover with or as of with a cloud; obscure

		Steel: mentally prepare oneself to do something difficult

		Stagger: walk or move unsteadily as if about to fall; continue uncertainly or precariously

		Benumb: deprive of physical or emotional feeling

		Falter: lose strength or momentum; speak in a hesitant or unsteady voice; move uncertainly in a way that shows lack of confidence

		Clamber: (v,n) climb, move, or get in or out in an awkward or laborious way

		Pallid: pale, typically because of poor health

		Sodden: saturated with liquid, soaked through

		Take in stride: accept advances or setbacks as the normal course of events

		Affront: action or remark causing outrage or offense; (v, usu. to be affronted)

		Gleam: shine brightly, esp. Reflecting light

		Quill: (n) main feathers of a bird; thin cylindrical tool

		Taut: stretched or pulled tight, not slack; (muscle) tense; (writing, music) concise and controlled; (v) tauten

		Slack: loose, part of a rope not taut

		Snarl: (animal) make an aggressive growl with bared teeth; say in an angry, bad tempered, voice.

		Scowl: (n,v) expression of anger

		Remonstrate: (with, nil) make a forcefully reproachful remark

		Harp: (on) talk and write persistently and tediously about a particular subject

		Florentine: characterized by a dull chased or rubbed finish

		Streak: (n) long, thin line or mark of a difference substance or color; an element in someone's character; continuous period of success; (v) cover with streaks

		Wisp: small thin or twisted bunch, piece, or amount

		Mawkish: sentimental in a feeble or sickly way

		Leer: look or gaze in an unpleasant, malicious, or lascivious way

		Scathing: witheringly scornful; severely critical

		Compère: person who introduces the performers or contestants

		Humor: comply with someone's wishes in order to keep them content, however unreasonable the wishes

		Wriggle: twist and turn with quick writhing

		Palaver: (n) prolonged, tedious, and idle fuss or discussion; (in Africa) a parley or improvised conference between two sides (v) talk unnecessarily at length; prattle, babble, blather, maunder, jabber

		Putative: reputed to be

		Wan: pale, giving the impression of illness or exhaustion; pallid, ashen, ghostly, deathly, sallow, etiolated; (of light) pale, weak; faint, dim, watery; (of a smile) lacking enthusiasm or energy; (of the sea) without luster; dark and gloomy

		Tattered: torn, old, in poor condition; in tatters

		Wainscot: wooden paneling that lines up the lower part of a wall

		Prurient: having an excessive interest in sexual matters

		Sybaritic: fond of sensuous luxury or pleasure

		Diffident: modest or shy because of lack of self confidence

		Connubial: conjugal

		Daunting: intimidating, difficult to deal with in anticipation

		Elation: great happiness and exhilaration

		Acrid: having an irritatingly strong and unpleasant smell or taste

		Rend: tear into two or more pieces; wrench (something) violently; cause great emotional pain to

		Phlegmatic: unemotional and stolidly calm disposition

		Besotted: (with) strongly infatuated (in foolish way)

		Laden: (with) heavily loaded or weighed down

		Eidetic: denoting mental images having unusual vividness and detail, as if actually visible

		Confound: cause surprise or confusion in someone

		Grueling: extremely tiring and demanding

		Hellion: rowdy, mischievous or troublemaking person, esp. a child

		Auspicious: favorable, conducive to success

		Drab: lacking brightness or interest; drearily dull

		Contrition: the state of feeling remorseful and penitent

		Maudlin: self-pityingly or tearfully sentimental, often through drunkenness

		Fetching: attractive, enchanting

		Pry: inquire too closely into a person's private affair; another term for prise

		Prise: use force in order to move, move apart, or open (something) ; jemmy, wrest, lever; obtain something from (someone) with effort or difficulty

		Lout: uncouth or aggressive man or boy

		Uncouth: (person, appearance, or behavior) lacking good manners, refinement, or grace; boorish, crass

		Plebeian: (Ancient Rome) a commoner

		Praetorian: (Ancient Rome) relating to the Royal guard

		Rake: (n) pole with comblike teeth at the end, for drawing together cut grass or fallen leaves, or smoothing loose soil or gravel; (v) to collect, gather, or move with a rake or similar implement

		Rabelaisian: displaying earthy humor, bawdy

		Bawdy: dealing with sexual matters in a comical way; humorously indecent; ribald, earthy

		Earthy: (person) direct and uninhibited; bawdy, lewd, uncouth; (humor) somewhat coarse or rude

		Dazzling: extremely bright, so as to bling the eyes temporarily

		Rue: bitterly regret (something one has done or allowed to happen) and wish it undone

		Rueful: expressing sorrow or regret, esp. in a slightly humorous way.

		Dredge: (v) clean out the bed of (harbor, river, or other surface of water) by scooping out mud, weeds and rubbish (with a dredge); (something up) bring attention to unpleasant or embarrassing fact or incident that had been forgotten

		Slither: move smoothly with a twisting or oscillating motion

		Canopy: ornamental cloth covering, hung or held up over something; a roof like projection or shelter; glass cover of an aircrafts cockpit; umbrella part of a parachute; uppermost trees or branches

		Drivel: (n) silly nonsense; (v) talk nonsense

		Wry: expressing dry, esp. mocking, humor; (face or features) twisted into an expression of disgust, disappointment, or annoyance

		Squalid: extremely dirty and unpleasant, esp. As a result of poverty or neglect

		Squalor: state of being squalid

		Genial: friendly and cheerful; (air or climate) pleasantly mild and warm

		Swoon: faint from extreme emotion

		Paramour: lover, esp. Illicit partner of a married person

		Profligate: recklessly extravagant, wasteful

		Shear (sheared, shorn): (v) cut the wool off; cut off (something such as hair, wool, or grass) with scissors or shears; (of) have something cut of;break off or cause to break off, owing to structural strain; (n) a strain produced by pressure in the structure of a substance, when its layers are laterally shifted in relation to each other

		Dainty: delicately small and pretty; delicate and graceful in build or movement; particularly good to eat; fastidious or difficult to please, esp. with food

		Geriatric: relating to old people, esp. health care

		Churlish: rude in a mean-spirited and surly way

		Surly: bad tempered and unfriendly

		Panegyric: public speech or published text in praise of someone or something

		Gall: (n) bold, impudent behavior; effrontery, impudence, cheek, insolence, audacity, temerity (a: temerarious); contents of the gallbladder, bile (proverbial for its bitterness), referring to something bitter or cruel; rancor, spleen, vitriol; annoyance, irritation, nuisance, bother, plague; abnormal growth on plants and trees (esp. oaks) in response to the presence of insect larvae, mites, or fungi; (esp. horse) a sore made by chaffing; ulcer, abrasion, graze, chafe (v) make someone feel annoyed; irritate, make someone's hackles rise, rile, rankle; make sore by rubbing

		Woe: great sorrow or distress (often used hyperbolically; things that cause sorrow or distress; troubles, misfortune, mishap, vicissitude, affliction

		Wreak: cause a large amount of damage or harm; (on someone) inflict (vengeance of some sort)

		Feckless: lacking initiative

		Harried: feeling strained from constant demands

		Bide: wait, stay, remain in a state or condition

		Sanguine: cheerfully optimistic

		Hermeneutics: branch of knowledge that deals with interpretation, esp. of the bible or literary texts

		Teleology: explanation of phenomena by the purposes they serve rather than by postulated causes

		Insuperable: impossible to overcome

		Betide: happen

		Dastardly: (humorous) wicked and cruel

		Contraption: machine or device that appears strange or unnecessarily complicated and often badly made or unsafe

		Hoist: raise by means of a rope

		Gristle: cartilage, esp. when found as tough, inedible tissue in meat

		Lumpen: uninterested in revolutionary advancements

		Swindle: use deception to deprive one of money or possessions

		Humbug: deceptive or false talk or behavior

		Ascetic: suggesting the practice of severe self-discipline, and abstention from any form of indulgence, typically for religious reasons

		Nonplussed: surprised or confused and unsure how to react

		Iconoclast: person who attacks cherished beliefs or institutions

		Coltish: energetic but awkward behavior

		Screed: long speech or writing typically regarded as tedious

		Gambol: (v,n) run or jump about playfully; frolic, caper, prance

		Haul: (v) pull or drag with force; (vehicle)  pull attached trailer or load

		Seam: a line along which two pieces of fabric are sewn together

		Invidious: likely to arouse or incur resentment

		Underinvoice: declare only a fraction of int. goods traded for a fraction of the sum. The rest is stored in overseas bank accounts (used to get money out of China)

		Cathexis: concentration of mental energy on one particular person, idea, object, esp. to an unhealthy degree

		Hector: talk in a bullying way

		At the behest: at a person's orders or command

		Hagiography: writing of the life of saints;  biography that idealizes its subject

		Catharsis: provide relief to strong or repressed emotions

		Lampoon: publicly criticize using ridicule

		Saturnine: slow and gloomy

		Sultry: (weather) hot and humid; (woman) attractive in a way that suggests a passionate nature

		Lurid: very vivid in color, creating an unpleasantly harsh or unnatural effect; presented in vividly shocking or sensational terms, esp. Giving explicit details of crimes or sexual matters

		Disheveled: of hair, clothes, or appearance, untidy, disordered

		Shudder: tremble convulsively as a result of fear or repugnance

		Hem in: restrict movement

		Bowdlerize: remove improper or offensive material from a text making it less effective (ety: after dr thomas bowdler (1754-1825) who published an expurgated edition of Shakespeare)

		Halcyon: (adj) period in time that was idyllically happy and peaceful

		Hew: carve; chop or cut with an ax, pick, or other tool

		Foist: impose an unwelcome or unnecessary person or thing on

		Balkanization: process of fragmentation of a region or state into hostile sub parts

		Dovetail: join by means of a dovetail; fit or cause to fit together and conveniently

		Circumspect: (adj) wary and unwilling to take risks

		Congenial: (of a person) pleasant for having similar interests, qualities, or personality, to one's own

		Trifling: trivial

		Scamper: (esp. Small animal or child) run with quick light steps (through fear or excitement)

		Jot (n): very small amount

		Expostulate: strongly disagree

		Alacrity: brisk and cheerful readiness

		Elude: evade in a skillful or cunning way

		Pine: (as v) suffer a mental and physical decline, esp. because if a broken heart; languish, waste away, dwindle, wilt, wither; miss or long for; yearn, long, ache

		Die judenfrage: the jewish question

		Peevish: easily annoyed, esp. With trivial subjects

		Ontology: study of existence or reality

		Anchoring: overpricing merchandise with intention of later marking it down

		Balk (at): hesitate or be unwilling to accept an idea or undertaking

		Morganatic: marriage between royal blood and inferior class were inferior/children status remain unchanged

		Compunction: anxiety from guilt/awareness

		Orchidaceous: ostentatious, showy

		Sclera: white part of eyes

		Askance: (look) with suspicion or disapproval

		Tumescent: bulging, esp. from sexual arousal; pompous or pretentious language.

		Bask: lie exposed to warmth and light

		Dawdle: waste time; be slow

		Erstwhile: former

		Monomania: obsessive enthusiasm or preoccupation for one thing

		Tepid: barely hot

		Fissiparous: inclined to cause or undergo division

		Sow: plant the seeds of

		Waft: pass or cause to pass gently as if through the air

		Exude: have a strong atmosphere of

		Vociferous: vehement, clamorous

		Snuff out: extinguish (a candle; in a brutal manner)

		Dilapidated: in a state of ruin as a result of age or neglect

		Iniquity: immoral or grossly unfair behavior

		Jowl: lower, fleshy, drooping part of a persons cheeks

		Bolster: long thick pillow; support, strengthen, prop up

		Embroil: involve deeply in argument or conflict

		Throng: of a crowd, densely fill

		Gambit: opening in which a player makes a small sacrifice for some compensating advantage

		Sulk: be silent, morose, or bad tempered as a result of disappointment

		Befall: something bad happen

		Squelch: sound made by a soft sucking sound, like boots walking heavily through mud

		Waylay: stop or interrupt and detain in conversation or trouble in some other way

		Meek: quiet, gentle, easily imposed on, submissive, obsequious

		Dither: be indecisive, add white noise

		Quell: put an end to; silence an unpleasant feeling

		Irk: irritate, annoy

		Confluence: junction of two rivers; process of merging

		Wean: be strongly influenced at a young age (antonym: wean off)

		Chasm: profound difference; deep fissure; gorge, abyss

		Treacle: cloying sentimentality or flattery

		Quip: (n,v) funny remark

		Obstreperous: noisy and difficult to control

		Beset: (of a problem) trouble or threaten (someone or something) persistently; hound, harry, dog, rack, afflict, torment; surround and harass; besiege, encircle, enclose, fence on; hem in; (archaic) be covered or studded with

		Serendipity: development of events by chance in a happy/beneficial way

		Lest: (c) with the intention of preventing something undesirable, to avoid the risk of

		Spoliation: ruining; taking property from somewhere by illegal or unethical means

		Rout: (n) disorderly retreat of defeated troops; a decisive defeat; an assembly of people who have made a move towards committing an illegal act which would constitute an offense of riot; a disorderly or tumultuous crowd; a large evening party or reception; a pack of wolves; (v) defeat and cause to retreat in disorder; cut a groove or any pattern not extending to the edges in (a wooden or metal surface); find (someone or something), or force them from a place

		Cloy: disgust with an excess of sweetness, richness, or sentiment

		Blemish: (v,n) spoil the appearance of something otherwise aesthetically perfect

		Obsequious: obedient or attentive to an excessive or servile degree

		Paean: a song of praise or triumph

		Jolt: (v,n) push or shake abruptly or roughly

		Stem: (boat) make headway against (the tide or currents); stop or restrict flow, spread

		Hull: hit or pierce hull of a ship with a missile

		Fester: of a wound, become septic, suppurate; become worse or more intense through long term neglect

		In the doldrums: period of inactivity, stagnation, despondency; equatorial Atlantic region with calm, sudden storms and light unpredictable winds

		Filibuster: inordinate length speech; unauthorized foreign warfare

		Fraught: (of a situation or course of action) filled with/destined to result in (something undesirable); causing or affected by great anxiety or stress

		Anacoluthon: literary device, starting a sentence to finish another (Greek: acoluthos: following) unexpected discontinuity in the expression of ideas

		Anapodoton: (Greek: without a main clause) rhetorical device consisting in an intentionally incomplete sentence (e.g. When in Rome)

		Emetic: causing vomiting

		Emollient: attempting to avoid confrontation; soothing or calming

		Homily: a sermon; a tedious moralizing discourse

		Eschew: deliberately avoid using; abstain from; forgo, shun, abjure, renounce, forsake, spurn, gainsay, dispense with, abnegate

		Apostasy: abandonment or renunciation to a religious/political belief

		Apostolic: relating to the apostles (or the pope)

		Winnow: (wind) blow; find the valuable part; remove until the best ones are left

		Chattel: personal possession

		Pediment: triangular upper part of a building in classical tradition, usually surmounting a portico of columns

		Rollicking: exuberantly lively and amusing

		To buffalo: to intimidate or overawe someone

		Awash: covered with water/presenting large quantities of

		Queasy: nauseated, feeling sick

		Mirth: amusement, especially expressed with laughter

		Sinew: strengthen, as if with sinews

		Keep afloat: sustain

		Solecism: grammatical mistake

		Bode: (does not bode well) herald, portend, augur

		Furlough: temporary release from prison/leave of absence

		Rasp: say in a harsh, grating voice

		Warren: network of rabbit burrows; densely populated or labyrinth building or district

		Dour: relentlessly severe, stern, gloomy in appearance or manner

		Scion: descendent of a notable family

		Sneer: smile on speak in a contemptuous mocking manner

		Green: inexperienced, untried

		Obdurate: stubbornly refusing to change one's course of action

		Haggard: looking exhausted or unwell, especially from fatigue, worry, or suffering

		Crone: thin and ugly woman

		Dreary: dull, bleak, lifeless

		Precincts: area within walls or boundaries

		Wreathe: cover, surround, or circle; festoon, garland, bedeck, adorn; twist or entwine (something flexible) round or over something; (especially of smoke) move with a curling motion; spiral, coil, corkscrew; form (flowers, leaves, or stems) into a wreath

		Cognoscenti: people considered especially well informed about a particular subject

		Agog: very eager

		Hackery: term the English use for the scribbling trade

		Janus-faced: having two sharply contrasting aspects

		Pedantic: meticulous, scrupulous

		Endemic: found among particular people or areas

		Troglodyte: cave dweller

		Phatic: speech to share feelings or establish sociable mood rather than communicate information or ideas

		Umbrage: offense, resentment; hint; shadow

		Jactitation: false boast detrimental to the interests of another

		Animus: strong feeling of dislike or hatred

		Maffick: rejoice or celebrate with boisterous demonstrations

		Maritorious: excessively devoted to one's husband

		Rixatrix: scolding or quarrelsome woman

		Laconic: terse or concise

		Demimonde: class of woman financially supported by lovers or protectors. Group with dubious respectability or marginal success

		Grawlixes: letters used to represent a bad word

		Braggadocio: boastful or arrogant behavior

		Atavism: evolutionary throwback

		Kingpin: master piece

		Sweltering: uncomfortably hot

		Histrionic: melodramatic behavior

		Prosody: movement in verbal time

		Teeming: be filled with; (of water, esp. rain) (down) fall heavily, pour down

		Moratorium: temporarily forbidden activity

		Apoplectic: overcome with anger; extremely indignant

		Apoptosis: programmed cell death (good kind of necrosis)

		Hemostasis: antonym of hemorrhage

		Brobdingnagian: gigantic

		Bequeath: to pass on (in a will, or not)

		Tartarean: infernal

		Wallow: stronger indulge, less negative

		Wallop: heavily defeat

		Attrition: wear down, enfeebling

		Prophylactically: to prevent an illness from occurring

		Abate: subside, diminish

		Groupuscule: political or religious splinter group

		Gerontocracy: society ruled by old people

		Senescent: deteriorating with age

		Exegesis: critical interpretation of a text, esp. scriptures

		To chance: to do something by accident

		Bellwether: leading sheep of a flock

		Apolaustic: devoted to enjoyment

		Lionize: give public attention, celebrate

		Obloquy: strong public criticism, verbal abuse
		"""

		
		let lines = words.split(separator: "\n")
		var dic = [String: String]()
		
		for l in lines {
			let line = String(l)
			if let i = line.index(of: ":"){
				let index = line.index(after: i)
				//print(index.encodedOffset)
				let word = String(line[..<i])
				let def = String(line[index...].trimmingCharacters(in: NSCharacterSet.whitespaces))
				dic[word] = def
			}
			
		}
		
		print(dic.count)
		dictionary = dic
		
		list = Array(dic.keys).sorted()
		filteredList = list
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

