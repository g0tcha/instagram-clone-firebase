//
//  HomeController.swift
//  InstagramFirebase
//
//  Created by Vincent on 18/04/2018.
//  Copyright © 2018 Vincent. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(HomePostCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.backgroundColor = .white
        
        setupNavigationItems()
        
        fetchPosts()
    }
    
    private func fetchPosts() {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
        
        FIRDatabase.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { snapshot in
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            let user = User(dictionary: userDictionary)
            
            let ref = FIRDatabase.database().reference().child("posts").child(uid)
            ref.observeSingleEvent(of: .value, with: { snapshot in
                guard let dictionaries = snapshot.value as? [String: Any] else { return }
                dictionaries.forEach({ (key, value) in
                    guard let dictionary = value as? [String: Any] else { return }
                    
                    let post = Post(user: user, dictionary: dictionary)
                    self.posts.append(post)
                })
                
                self.collectionView?.reloadData()
            }) { (err) in
                print("Failed to fetch posts:", err)
            }
            
        }) { err in
            print("Failed to fetch user for posts: ", err)
        }
    }
    
    private func setupNavigationItems() {
        navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "logo2"))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 40 + 8 + 8
        height += view.frame.width
        height += 50
        height += 60
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomePostCell
        cell.post = posts[indexPath.item]
        return cell
    }
    
}
