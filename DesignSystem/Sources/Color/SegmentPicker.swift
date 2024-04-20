import SwiftUI
import DesignSystem

public struct SegmentControl: View{
    @Binding var selectedIndex: Int
    let options: [String]
    
    public var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.gray30)
                    .padding(4)
                    .frame(width: geo.size.width / CGFloat(options.count))
                    .offset(x: geo.size.width / CGFloat(options.count) * CGFloat(selectedIndex), y: 0)
            }
            .frame(height: 44)
            
            HStack(spacing: 0) {
                ForEach((0..<options.count), id: \.self) { index in
                    Text(options[index])
                        .atFont(.subHeadLine, color: selectedIndex == index ? .gray100 : .gray60)
                        .frame(maxWidth: .infinity)
                        .background(.white.opacity(0.0000001))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                selectedIndex = index
                            }
                        }
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray20)
        )
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray30, lineWidth: 1)
        }
    }
}
