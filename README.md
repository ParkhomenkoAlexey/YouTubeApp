# YouTubeApp

---
- [Customizing NavigationBar title](#Customizing-NavigationBar-title)
- [Make StatusBar more darker](#Make-StatusBar-more-darker)
- [Add MenuBar View to the NavigationBar](#Add-MenuBar-View-to-the-NavigationBar)
- [Put UICollectionView into UIView](#Put-UICollectionView-into-UIView)
- [Initialization lifehack in MenuBarCollectionView](#Initialization-lifehack-in-MenuBarCollectionView)
- [Coloring Icons](#Coloring-Icons)
---
- [Omit СollectionView below because of the MenuBar](#Omit-СollectionView-below-because-of-the-MenuBar)
---

## Customizing NavigationBar title

**Before**

![YouTubeApp](https://github.com/ParkhomenkoAlexey/Images/blob/master/YouTubeApp1.png)

#### YouTubeCVC.swift file
```swift
    fileprivate func CustomizingTitle() {
         navigationItem.title = "Home"
    }
```

**After**

![YouTubeApp](https://github.com/ParkhomenkoAlexey/Images/blob/master/YouTubeApp2.png)

#### YouTubeCVC.swift file
```swift
    fileprivate func CustomizingTitle() {
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
```

## Make StatusBar more darker

**Result**

![YouTubeApp](https://github.com/ParkhomenkoAlexey/Images/blob/master/YouTubeApp.png)

#### AppDelegate.swift file
```swift
fileprivate func HighlightStatusBar() {
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
        statusBarBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        window?.addSubview(statusBarBackgroundView)
        
        statusBarBackgroundView.leadingAnchor.constraint(equalTo: (window?.leadingAnchor)!).isActive = true
        statusBarBackgroundView.trailingAnchor.constraint(equalTo: (window?.trailingAnchor)!).isActive = true
        statusBarBackgroundView.topAnchor.constraint(equalTo: (window?.topAnchor)!).isActive = true
        statusBarBackgroundView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
```

**!!!** `(equalToConstant: 20)` don't work at iPhone 10 + **!!!**

## Add MenuBar View to the NavigationBar

**Result**

![YouTubeApp](https://github.com/ParkhomenkoAlexey/Images/blob/master/YouTubeApp3.png)

#### YouTubeCVC.swift file
```swift
private let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
```
```swift
    private func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
```

### What is the MenuBar?
It is a simple red `view` that has got `UICollectionView` inside

#### MenuBar.swift file
```swift
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.YouTubeRed()
        translatesAutoresizingMaskIntoConstraints = false
        setupCollectioView()
    }
```

## Put UICollectionView into UIView

#### MenuBar.swift file
```swift
lazy var menuBarCV = MenuBarCollectionView()
```
```swift
    func setupCollectioView() {
        addSubview(menuBarCV)
        // menuBarCV constraints
        menuBarCV.fillSuperview()
    }
```

**!!!** `menuBarCV.fillSuperview()` description you can find here: fdfdgegersdfe **!!!**

### What is the MenuBarCollectionView?
It is a simple collectionView that contains 4 cells 

## Initialization lifehack in MenuBarCollectionView

#### MenuBarCollectionVIew.swift file

```swift
class MenuBarCollectionView: UICollectionView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
```

```swift
init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        register(MenuBarCell.self, forCellWithReuseIdentifier: "cell")
    
        // в приложении Interval Timer посмотреть как я определял текущий IndexPath
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition())
    }
```

**Pay attention on this three lines of code - right initialization**
```swift
let layout = UICollectionViewFlowLayout()
layout.scrollDirection = .horizontal
super.init(frame: .zero, collectionViewLayout: layout)
```

## Coloring Icons

**Result**

![YouTubeApp](https://github.com/ParkhomenkoAlexey/Images/blob/master/YouTubeApp4.png)

If a cell is selected, it is painted white, otherwise brown.

#### MenuBarCell.swift file
```swift
    lazy var menuImageView: UIImageView = {
        let im = UIImageView()
        im.translatesAutoresizingMaskIntoConstraints = false
        im.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return im
    }()
    
    override var isSelected: Bool {
        didSet {
            menuImageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
```

#### MenuBarCollectionVIew.swift file
```swift
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MenuBarCell
        
        cell.menuImageView.image = UIImage(named: "\(imagesNames[indexPath.item])")?.withRenderingMode(.alwaysTemplate)

        return cell
    }
```

And select the first image in init method:
#### MenuBarCollectionVIew.swift file
```swift
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        dataSource = self
        register(MenuBarCell.self, forCellWithReuseIdentifier: "cell")
    
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition())
    }
```

`withRenderingMode(.alwaysTemplate)` - Always draw the image as a template image, ignoring its color information.

## Omit СollectionView below because of the MenuBar

#### YouTubeCVC.swift file

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomizingTitle()
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(YouTubeCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        setupMenuBar()
        
        // The custom distance that the content view is inset from the safe area or scroll view edges.
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        // The distance the scroll indicators are inset from the edge of the scroll view.
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
    }
```

## Author
| [<img src="https://avatars1.githubusercontent.com/u/8983647?s=460&amp;v=4" width="120px;"/>](https://github.com/ParkhomenkoAlexey)   | [Parkhomenko Alexey](https://github.com/ParkhomenkoAlexey)<br/><br/><sub>iOS Software Engineer</sub><br/> [![Facebook][1.1]][1] [![Github][2.1]][2] [![VKontakte][3.1]][3]|
| - | :- |

[1.1]: https://www.kingsfund.org.uk/themes/custom/kingsfund/dist/img/svg/sprite-icon-facebook.svg (facebook icon)
[2.1]: http://i.imgur.com/9I6NRUm.png (github icon without padding)
[3.1]: https://github.com/ParkhomenkoAlexey/Images/blob/master/Orion_vk.svg (vk icon)


[1]: https://www.facebook.com/profile.php?id=100030997816322
[2]: https://github.com/ParkhomenkoAlexey
[3]: https://vk.com/id189198242
