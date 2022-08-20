# Food_Ordering

#### Creating the onboarding screen
    - The [LaunchScreen] is loaded when the user clicked on the icon App
    - How to create the extension for the view like corner radius
        
    + Component using : 
        1. Collection View
                + Autolayout for collection view 
                + Select attribute [Estimate Size] = none 
                + enable Page if wanna click to page and page
            - Create a [CollectionViewCell] by cocotouch include 
                + AutoLayout
                + Map the components like label or image to CollectionViewCell
                + Config the [Class] for View as CardView
                + Config the [Collection Reuseable View] as the name of the CollectionViewCell
        1.1 Table View
            - Config Separator
            - Background Color = Clear
            - Editing: No selection during editing
        2. Page Control 
            + Just set the currentPage property for display
        3. Bar Button Item -> Cart icon 
            + Put it into the navigation bar as the button
        4. Scroll View
            + 
