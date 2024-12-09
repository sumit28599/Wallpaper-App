//
//  GalleryVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 05/12/24.
//



import UIKit

class GalleryVC: UIViewController {
    
    private var categoryListTableView: UITableView!
    private var wallpapertext = UILabel()
    private var scrollView: UIScrollView!
    private var contentView: UIView!
    private var collectionView: UICollectionView!
    private let items = ["Home", "Category"]
    var allWallpapers : [Photo] = []
    let stackView = UIStackView()
    let homeButton = UIButton(type: .system)
    let Categorybutton = UIButton(type: .system)
    var underlineView: UIView?
    
    let viewModel = GalleryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .app
        
        setupLabel()
        navigationItem.titleView = wallpapertext
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        // Setup StackView
        setupStackView()
        
        // Setup Buttons
        setupButtons()
        
        // Setup Wallpaper UI View
        setupUI()
        
        // Setup Wallpaper UI TableView
        setupCategoryTableView()
        
        // Get data from server
        viewModel.getImageData()
        
        // Data Binding
        bindings()
        
        // Home Button action Binding
        buttonTapped(homeButton)
    }
    
    
    //MARK: Call binging function
    func bindings(){
        self.viewModel.error.bind { [weak self] error in
            print(error)
        }
        
        self.viewModel.imageResponse.bind { [weak self] result in
            guard let result else { return }
            print(result)
            
            self?.allWallpapers = result.results
            DispatchQueue.main.async {
                self?.categoryListTableView.reloadData()
                self?.collectionView.reloadData()
                
            }
        }
    }
    
    //MARK: Set stack view
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add buttons to the stack view
        stackView.addArrangedSubview(homeButton)
        stackView.addArrangedSubview(Categorybutton)
    }
    
    //MARK: Set Button view
    func setupButtons() {
        homeButton.setTitle("Home", for: .normal)
        homeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        Categorybutton.setTitle("Category", for: .normal)
        Categorybutton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        homeButton.setTitleColor(.white, for: .normal)
        Categorybutton.setTitleColor(.white, for: .normal)
    }
    
    //MARK: Set button tapped action
    @objc func buttonTapped(_ sender: UIButton) {
        underlineView?.removeFromSuperview()
        
        if sender == homeButton {
            collectionView.isEditing = false
            categoryListTableView.isHidden = true
        } else if sender == Categorybutton {
            collectionView.isEditing = true
            categoryListTableView.isHidden = false
            
        }
        
        let underline = UIView()
        underline.backgroundColor = .white
        underline.translatesAutoresizingMaskIntoConstraints = false
        stackView.addSubview(underline)
        
        NSLayoutConstraint.activate([
            underline.heightAnchor.constraint(equalToConstant: 2),
            underline.widthAnchor.constraint(equalToConstant: 80),
            underline.topAnchor.constraint(equalTo: sender.bottomAnchor, constant: 5),
            underline.centerXAnchor.constraint(equalTo: sender.centerXAnchor)
        ])
        
        // Save the underline view
        underlineView = underline
    }
    
    //MARK: Set wallpaper text
    
    func setupLabel() {
        wallpapertext.font = .font(family: .poppins, sizeFamily: .semibold, size: 20)
        wallpapertext.text = "HD Wallpaper"
        wallpapertext.textColor = .white
        wallpapertext.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return Self.createFeaturedSection()
            case 1:
                return Self.createTopWallpapersSection()
            default:
                return nil
            }
        }

        // Initialize the scroll view
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
                                scrollView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Add content view inside scroll view
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Collection View Setup
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(GalleryCVC.self, forCellWithReuseIdentifier: "GalleryCVC")

        collectionView.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }

    // MARK: - Compositional Layout Sections
    private static func createFeaturedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(300), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(300), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 10, trailing: 16)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [header]
        return section
    }

    private static func createTopWallpapersSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(100), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(5)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [header]
        return section
    }

    //MARK: Set category table view
    func setupCategoryTableView() {
        
        categoryListTableView = UITableView(frame: .zero, style: .plain)
        categoryListTableView.rowHeight = 150
        categoryListTableView.separatorStyle = .singleLine
        categoryListTableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        categoryListTableView.dataSource = self
        categoryListTableView.delegate = self
        categoryListTableView.isHidden = true
        categoryListTableView.register(GalleryTVC.self, forCellReuseIdentifier: "GalleryTVC")
        view.addSubview(categoryListTableView)
        
        categoryListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryListTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            categoryListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            categoryListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    class func instanciate() -> GalleryVC {
        let vc = GalleryVC()
        return vc
    }
}

// MARK: - UICollectionView DataSource and Delegate
extension GalleryVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  allWallpapers.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCVC", for: indexPath) as! GalleryCVC
        let imageName = allWallpapers[indexPath.item]
        if indexPath.section == 0 {
            let nameValue = viewModel.stringSeprater(stringValue: "\(imageName.slug)")
            cell.configure(imageUrl: "\(imageName.urls.regular)", title: nameValue)
        } else {
            cell.configure(imageUrl: "\(imageName.urls.regular)", title: "")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            fatalError("Error no element header found ")
        }
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderView.reuseIdentifier, for: indexPath) as! CustomHeaderView
        if indexPath.section == 0 {
            headerView.titleLabel.text = "Featured"
            headerView.seeMoreButton.isHidden = true
        } else {
            headerView.titleLabel.text = "Top Wallpaper"
            headerView.seeMoreButton.isHidden = false
        }
        
        headerView.seeMoreButton.tag = indexPath.section
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let selectedItem = self.allWallpapers[indexPath.item]
            let url = selectedItem.urls.regular
            let vc = FullImageVC.instanciate()
            vc.imageUrl = url
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
        }
    
}


// MARK: - UITableView DataSource and Delegate

extension GalleryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allWallpapers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTVC") as! GalleryTVC
        let nameValue = viewModel.stringSeprater(stringValue: "\(allWallpapers[indexPath.row].slug)")
        cell.configure(imageUrl: "\(allWallpapers[indexPath.row].urls.regular)", title: nameValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = self.allWallpapers[indexPath.row]
        let url = selectedItem.urls.regular
        let vc = FullImageVC.instanciate()
        vc.imageUrl = url
        UIStoryboard.makeNavigationControllerAsRootVC(vc)
    }
}


