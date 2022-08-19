//
//  Onboarding_VC.swift
//  Food_Ordering
//
//  Created by Huy Binh on 19/08/2022.
//

import UIKit

class Onboarding_VC: UIViewController,
                        UICollectionViewDelegate,
                     UICollectionViewDataSource,
                        UICollectionViewDelegateFlowLayout {
    
    //Must be Implement from interface
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Onboarding_CollectionViewCell.identitier, for: indexPath) as! Onboarding_CollectionViewCell

        cell.setup(slides[indexPath.row])
        
        return cell
    }
    // Manually Implementation from interface
    
    // set size for each item in the collection
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width,
                         height: collectionView.frame.height)
        
        return size
    }
    
    var currentPage = 0 {
        didSet {
            if currentPage == slides.count - 1 {
                btn_Next.setTitle("Get Started", for: .normal)
            }else {
                btn_Next.setTitle("Next", for: .normal)
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btn_Next: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides : [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      slides = [
//                    OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
//                    OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
//                    OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
//                ]
        slides = [
                    OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                    OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
                    OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "slide3"))
                ]
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    @IBAction func nextBtn_clicked(_ sender: UIButton) {

        if currentPage == slides.count - 1 {
            let sbController = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            // cai dat thuoc tinh
            sbController.modalPresentationStyle = .fullScreen
            sbController.modalTransitionStyle = .flipHorizontal
            //hien thi
            present(sbController, animated: true)
            
        }else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        pageControl.currentPage = currentPage
    }

}
