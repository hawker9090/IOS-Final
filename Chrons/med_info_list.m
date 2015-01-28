

//similar to information.m
#import "med_info_list.h"

@interface med_info_list ()
{
    NSMutableArray* chapters;
}
@end


@implementation med_info_list

@synthesize _table;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background.png"]];
    
    _table.backgroundView = backgroundImage;
    _table.opaque = NO;
    
    //create chapters
    chapters = [[NSMutableArray alloc]initWithObjects:@"Anti Inflammatory",@"Immune System Suppressors", @"Medications and Cancer Risk",@"Antibiotics",@"Other Medications", nil];
    
    _table.contentInset = UIEdgeInsetsZero;
    
    
    [super viewDidLoad];

}

-(void) viewDidAppear:(BOOL)no{
    self.tabBarController.title = @"Medication";
    
    _table.contentInset = UIEdgeInsetsZero;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    //get cell value
    NSString* cellValue = [chapters objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.opaque = NO;
    
    return cell;
        
        
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedCell = nil;
    selectedCell = [chapters objectAtIndex: indexPath.row];
    
    NSString* htmlCode;
    
    //depending on which row display different html
    switch(indexPath.row)
    {
        case 0:
        {
            htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
            <h2><strong>Anti Inflammatory Drugs</strong></h2>\
            <p><strong>Sulfasalazine (Azulfidine)</strong></p>\
            <ul>\
            <li>Although this drug isn't always effective for treating Crohn's disease, it may be of some help for Crohn's that affects the colon. It has a number of side effects, including nausea, vomiting, heartburn and headache. Don't take this medication if you're allergic to sulfa medications.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Mesalamine (Asacol, Rowasa)</strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>This medication is less likely to cause side effects than sulfasalazine, but possible side effects include nausea, vomiting, heartburn, diarrhea and headache. You take it in tablet form or use it rectally in the form of an enema or suppository, depending on which part of your colon is affected. This medication is generally ineffective for disease involving the small intestine.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Corticosteroids. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Corticosteroids can help reduce inflammation anywhere in your body, but they have numerous side effects, including a puffy face, excessive facial hair, night sweats, insomnia and hyperactivity. More-serious side effects include high blood pressure, diabetes, osteoporosis, bone fractures, cataracts, glaucoma and an increased susceptibility to infections. Long-term use of corticosteroids in children can lead to stunted growth.</li>\
            </ul>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Also, these medications don't work for everyone with Crohn's disease. Doctors generally use corticosteroids only if you have moderate to severe inflammatory bowel disease that doesn't respond to other treatments. A newer type of corticosteroid, budesonide (Entocort EC), works faster than do traditional steroids and appears to produce fewer side effects. Entocort EC is effective only in Crohn's disease that involves the lower small intestine and the first part of the large intestine.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <ul>\
            <li>Corticosteroids aren't for long-term use. But, they can be used for short-term (three to four months) symptom improvement and to induce remission. Corticosteroids also may be used with an immune system suppressor — the corticosteroids can induce remission, while the immune system suppressors can help maintain remission.</li>\
            </ul>\
            <p>&nbsp;</p>\
            </body>\
            </html>";
            break;
        }
        case 1:
        {
            htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
            <h2><strong>Immune system suppressors</strong></h2>\
            <p>&nbsp;</p>\
            <ul>\
            <li>These drugs also reduce inflammation, but they target your immune system rather than directly treating inflammation. By suppressing the immune response, inflammation is also reduced. Sometimes, these drugs are used in combination. For example, a combination of azathioprine and infliximab has been shown to work better than either drug alone in some people. Immunosuppressant drugs include:</li>\
            </ul>\
            <p>&nbsp;</p>\
            <p><strong>Azathioprine (Imuran) and mercaptopurine (Purinethol).</strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>These are the most widely used immunosuppressants for treatment of inflammatory bowel disease. If you're taking either of these medications, you'll need to follow up closely with your doctor and have your blood checked regularly to look for side effects, such as a lowered resistance to infection. These drugs may also cause nausea and vomiting.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Infliximab (Remicade). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>This drug is for adults and children with moderate to severe Crohn's disease. It may be used soon after diagnosis, particularly if your doctor suspects that you're likely to have more severe Crohn's disease or if you have a fistula. It's also used after other drugs have failed. It may be combined with an immunosuppressant in some people, but this practice is somewhat controversial. Infliximab works by neutralizing a protein produced by your immune system known as tumor necrosis factor (TNF). Infliximab finds TNF in your bloodstream and removes it before it causes inflammation in your intestinal tract.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Some people with heart failure, people with multiple sclerosis, and those with cancer or a history of cancer can't take infliximab or the other members of this class (adalimumab and certolizumab pegol). Talk to your doctor about the potential risks of taking infliximab. Tuberculosis and other serious infections have been associated with the use of immune-suppressing drugs. If you have an active infection, don't take these medications. You should have a skin test for tuberculosis, a chest X-ray and a test for hepatitis B before taking infliximab.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p><strong>Adalimumab (Humira). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Adalimumab works similarly to infliximab by blocking TNF for people with moderate to severe Crohn's disease. It can be used soon after you're diagnosed if you have a fistula, or if you have more severe Crohn's disease. It also may be used after other medications have failed to improve your symptoms. Adalimumab may be used instead of infliximab or certoluzimab pegol, or it can be used if infliximab or certoluzimab pegol stop working. Adalimumab may reduce the signs and symptoms of Crohn's disease and may cause remission.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>However, adalimumab, like infliximab, carries a small risk of infections, including tuberculosis and serious fungal infections. You should have a skin test for tuberculosis, a chest X-ray and a test for hepatitis B before taking infliximab. The most common side effects of adalimumab are skin irritation and pain at the injection site, nausea, runny nose, and upper respiratory infection.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p><strong>Certolizumab pegol (Cimzia). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Approved by the Food and Drug Administration (FDA) for the treatment of Crohn's disease, certolizumab pegol works by inhibiting TNF. Certolizumab pegol is prescribed for people with moderate to severe Crohn's disease. Certolizumab pegol may be used instead of infliximab or adalimumab, or it can be used if infliximab or adalimumab stop working. Common side effects include headache, upper respiratory infections, abdominal pain, nausea and reactions at the injection site. Like other medications that inhibit TNF, because this drug affects your immune system, you're also at risk of becoming seriously ill with certain infections, such as tuberculosis. You should have a skin test for tuberculosis, a chest X-ray and a test for hepatitis B before starting certolizumab pegol.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Methotrexate (Rheumatrex). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>This drug, which is used to treat cancer, psoriasis and rheumatoid arthritis, is sometimes used for people with Crohn's disease who don't respond well to other medications. Short-term side effects include nausea, fatigue and diarrhea, and rarely, it can cause potentially life-threatening pneumonia. Long-term use can lead to scarring of the liver and sometimes to cancer. Avoid becoming pregnant while taking methotrexate. If you're taking this medication, follow up closely with your doctor and have your blood checked regularly to look for side effects.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Cyclosporine (Gengraf, Neoral, Sandimmune). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>This potent drug, often used to help heal Crohn's-related fistulas, is normally reserved for people who haven't responded well to other medications. Cyclosporine has the potential for serious side effects, such as kidney and liver damage, seizures, and fatal infections. This medication isn't for long-term use.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Natalizumab (Tysabri).</strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>This drug works by inhibiting certain immune cell molecules — integrins — from binding to other cells in your intestinal lining. Blocking these molecules is thought to reduce chronic inflammation that occurs when they bind to your intestinal cells. Natalizumab is approved for people with moderate to severe Crohn's disease with evidence of inflammation and who aren't responding well to other conventional Crohn's disease therapies including TNF blockers and immunomodulators. Because the drug is associated with a rare, but serious, risk of multifocal leukoencephalopathy — a brain infection that usually leads to death or severe disability — you must be enrolled in a special restricted distribution program to use it.</li>\
                </ul>\
                <p>&nbsp;</p>\
            </body>\
            </html>";
            break;
        }
        case 2:
        {
            htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
            <h2><strong>Medications and cancer risk</strong></h2>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Immune system suppressors also are associated with a small risk of developing cancer such as lymphoma. These include azathioprine, mercaptopurine, methotrexate, infliximab, adalimumab, certolizumab pegol and others. The risk may be due to the immune system suppression that these medications cause. While these medications do increase risk, they may be necessary for people with Crohn's disease to improve quality of life and avoid surgery or hospitalization. Work with your doctor to determine which medications are right for you.</li>\
                </ul>\
                <p>&nbsp;</p>\
            </body>\
            </html>";
            break;
        }
        case 3:
        {
            htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
            <h2><strong>Antibiotics</strong></h2>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Antibiotics can reduce the amount of drainage and sometimes heal fistulas and abscesses in people with Crohn's disease. Researchers also believe antibiotics help reduce harmful intestinal bacteria and suppress the intestine's immune system, which can trigger symptoms. However, there's no strong evidence that antibiotics are effective for Crohn's disease. Frequently prescribed antibiotics include:</li>\
            </ul>\
            <p>&nbsp;</p>\
            <p><strong>Metronidazole (Flagyl). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Once the most commonly used antibiotic for Crohn's disease, metronidazole can cause serious side effects, including numbness and tingling in your hands and feet and, occasionally, muscle pain or weakness. If these effects occur, stop the medication and call your doctor.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Ciprofloxacin (Cipro). </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>This drug, which improves symptoms in some people with Crohn's disease, is now generally preferred to metronidazole. A rare side effect of this medication is tendon rupture.</li>\
            </ul>\
            </body>\
            </html>";
            break;
        }
        case 4:
        {
            htmlCode = @"<html><body background = \"http://i60.tinypic.com/zocpk2.png\">\
            <h2><strong>Other medications</strong></h2>\
            <p>&nbsp;</p>\
            <p>In addition to controlling inflammation, some medications may help relieve your signs and symptoms. Depending on the severity of your Crohn's disease, your doctor may recommend one or more of the following:</p>\
            <p>&nbsp;</p>\
            <p><strong>Anti-diarrheals. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>A fiber supplement, such as psyllium powder (Metamucil) or methylcellulose (Citrucel), can help relieve mild to moderate diarrhea by adding bulk to your stool. For more severe diarrhea, loperamide (Imodium) may be effective. Use anti-diarrheals with caution and only after consulting your doctor.</li>\
            </ul>\
            <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Laxatives. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>In some cases, swelling may cause your intestines to narrow, leading to constipation. Talk to your doctor before taking any laxatives, because even those sold over-the-counter may be too harsh for your system.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Pain relievers.</strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>For mild pain, your doctor may recommend acetaminophen (Tylenol, others). Avoid aspirin, ibuprofen (Advil, Motrin, others) and naproxen (Aleve). These are likely to make your symptoms worse.</li>\
            </ul>\
            <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Iron supplements. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>If you have chronic intestinal bleeding, you may develop iron deficiency anemia. Taking iron supplements may help restore your iron levels to normal and reduce this type of anemia once your bleeding has stopped or diminished.</li>\
            </ul>\
            <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Nutrition. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Your doctor may recommend a special diet given via a feeding tube (enteral nutrition) or nutrients injected into a vein (parenteral nutrition) to treat your Crohn's disease. This can improve your overall nutrition and allow the bowel to rest. Bowel rest can reduce inflammation in the short term. However, once regular feeding is restarted, your signs and symptoms may return. Your doctor may use nutrition therapy short term and combine it with other medications, such as immune system suppressors. Enteral and parenteral nutrition are typically used to get people healthier for surgery or when other medications fail to control symptoms. Your doctor may also recommend a low residue or low-fiber diet if you have a narrowed bowel (stricture) to try to reduce the risk of a blockage. A low residue diet is one that's designed to reduce the size and number of your stools.</li>\
            </ul>\
            <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Vitamin B-12 shots. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>Vitamin B-12 helps prevent anemia, promotes normal growth and development, and is essential for proper nerve function. It's absorbed in the terminal ileum, a part of the small intestine often affected by Crohn's disease. If inflammation of your terminal ileum is interfering with your ability to absorb this vitamin, you may need monthly B-12 shots for life. You'll also need lifelong B-12 injections if your terminal ileum has been removed during surgery.</li>\
                </ul>\
                <p>&nbsp;</p>\
            <p>&nbsp;</p>\
            <p><strong>Calcium and vitamin D supplements. </strong></p>\
            <p>&nbsp;</p>\
            <ul>\
            <li>You may need to take a calcium supplement with added vitamin D. This is because Crohn's disease and steroids used to treat it can increase your risk of osteoporosis. Ask your doctor if a calcium supplement is right for you.</li>\
            </ul>\
            </body>\
            </html>";
            break;
        }
        default:
            break;
    }
    
    //display as web view
    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 580)];
    [wv loadHTMLString:htmlCode baseURL:nil];
    
    UIViewController* nvc = [[UIViewController alloc] init];
    [nvc.view addSubview:wv];
    
    [self.navigationController pushViewController:nvc animated:YES];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [chapters count];
}

-(CGFloat)tableView:(UITableView*)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
