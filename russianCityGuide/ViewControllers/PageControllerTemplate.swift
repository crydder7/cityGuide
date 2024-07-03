import UIKit

class PageControllerTemplate: UIPageViewController {
    
    weak var city: City!
    var page1 = mainCityScreen()
    var page2 = weatherScreen()
    let page3 = MapScreen()
    lazy var pages = [page1, page2, page3]
    var animator = UIDynamicAnimator()
    var str = AttributedString()
    let queue = DispatchQueue(label: "throw city", qos: .userInteractive)
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        setViewControllers([pages[0]], direction: .forward, animated: true)
        queue.async {
            self.page1.city = self.city
            self.page2.city = self.city
            self.page3.city = self.city
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageControl = UIPageControl.appearance()
        pageControl.backgroundStyle = .prominent
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray
        
        self.title = city.name
        self.dataSource = self
        self.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(goBack(sender:)))
    }
    
    @objc func goBack(sender:UIButton){
        self.view.isHidden = true
        navigationController?.popViewController(animated: true)
        navigationController?.viewControllers.last?.view.isHidden = false
    }
    
    public func throwCity() async{
        self.page1.city = self.city
        self.page2.city = self.city
        self.page3.city = self.city
    }
}

extension PageControllerTemplate : UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController),
                     currentIndex > 0 else {
                   return nil
               }
        return pages[currentIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController),
                     currentIndex < pages.count - 1 else {
                   return nil
               }
        return pages[currentIndex + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = pages.firstIndex(of: firstViewController) else { return 0 }
                return firstViewControllerIndex
    }
    
}
